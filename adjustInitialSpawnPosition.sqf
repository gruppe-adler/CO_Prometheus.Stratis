// spawn outside of map on flat terrain if possible
private _alternativeSpawnsOutsideMap = [[-2500,-500],[-500,-2500],[-2500,500]];

private _waterAroundMap = ["waterAroundMap",false] call prometheus_fnc_getIslandCfgEntry;
private _playerPositionsForCurrentWorld = 	[
	["startPosOpf",[0,0,0]] call prometheus_fnc_getIslandCfgEntry,
	["startPosBlu",[0,0,0]] call prometheus_fnc_getIslandCfgEntry,
	["startPosInd",[0,0,0]] call prometheus_fnc_getIslandCfgEntry
];

//overwrite with zeus-set positions
if (!isNil "prometheus_startPosOpf") then {_playerPositionsForCurrentWorld set [0,prometheus_startPosOpf]};
if (!isNil "prometheus_startPosBlu") then {_playerPositionsForCurrentWorld set [1,prometheus_startPosBlu]};
if (!isNil "prometheus_startPosInd") then {_playerPositionsForCurrentWorld set [2,prometheus_startPosInd]};


if (isServer) then {
	_targetPosition= _playerPositionsForCurrentWorld select 0;
	"respawn_east" setMarkerPos _targetPosition;

	_targetPosition= _playerPositionsForCurrentWorld select 1;
	"respawn_west" setMarkerPos _targetPosition;
	"respawn_civilian" setMarkerPos _targetPosition;

	_targetPosition= _playerPositionsForCurrentWorld select 2;
	"respawn_guerrila" setMarkerPos _targetPosition;

	[_playerPositionsForCurrentWorld] spawn {
		params ["_playerPositionsForCurrentWorld"];

 		{
 			if (!isPlayer _x) then {
	 			sleep 0.1;

				_targetPosition = switch (side _x) do {
					case (EAST): {_playerPositionsForCurrentWorld select 0};
					case (INDEPENDENT): {_playerPositionsForCurrentWorld select 2};
					default {_playerPositionsForCurrentWorld select 1};
				};

				_tmpPos = [_targetPosition,[0,10],[0,360]] call prometheus_fnc_findRandomPos;
				_x setPos _tmpPos;
				_x switchmove "AmovPercMstpSnonWnonDnon";
 			};
 		} forEach allUnits;
 	};
};



if (!hasInterface) exitWith {};
[{!isNull player}, {
	params ["_playerPositionsForCurrentWorld"];

	_targetPosition = switch (playerSide) do {
		case (EAST): {_playerPositionsForCurrentWorld select 0};
		case (INDEPENDENT): {_playerPositionsForCurrentWorld select 2};
		default {_playerPositionsForCurrentWorld select 1};
	};

	_tmpPos = [_targetPosition,[0,10],[0,360]] call prometheus_fnc_findRandomPos;
	player setPos [_tmpPos select 0, _tmpPos select 1, 0]; // force to ZERO height
	player switchmove "AmovPercMstpSnonWnonDnon";
}, [_playerPositionsForCurrentWorld]] call CBA_fnc_waitUntilAndExecute;
