#include "..\missionMacros.h"

diag_log format ["setup: initial spawn position initiated"];

// spawn outside of map on flat terrain if possible
private _alternativeSpawnsOutsideMap = [[-2500,-500],[-500,-2500],[-2500,500]];

private _waterAroundMap = ["waterAroundMap",false] call prometheus_fnc_getIslandCfgEntry;
private _playerPositionsForCurrentWorld = if !(_waterAroundMap) then {
	_alternativeSpawnsOutsideMap
} else {
	[
		["startPosOpf",[0,0,0]] call prometheus_fnc_getIslandCfgEntry,
		["startPosBlu",[0,0,0]] call prometheus_fnc_getIslandCfgEntry,
		["startPosInd",[0,0,0]] call prometheus_fnc_getIslandCfgEntry
	]
};

_targetPosition = switch (playerSide) do {
	case (EAST): {_playerPositionsForCurrentWorld select 0};
	case (INDEPENDENT): {_playerPositionsForCurrentWorld select 2};
	default {_playerPositionsForCurrentWorld select 1};
};


if (isServer) then {
	_targetPosition= _playerPositionsForCurrentWorld select 0;
	_tmpPos_arsenal_1 = [_targetPosition,[0,10], random 360,0,[5,80]] call SHK_pos;
	arsenal_1 setPos _tmpPos_arsenal_1;

	_targetPosition= _playerPositionsForCurrentWorld select 1;
	_tmpPos_arsenal_2 = [_targetPosition,[0,10], random 360,0,[5,80]] call SHK_pos;
	arsenal_2 setPos _tmpPos_arsenal_2;

	_targetPosition= _playerPositionsForCurrentWorld select 2;
	_tmpPos_arsenal_3 = [_targetPosition,[0,10], random 360,0,[5,80]] call SHK_pos;
	arsenal_3 setPos _tmpPos_arsenal_3;

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

				_tmpPos = [_targetPosition,[0,10], random 360,0,[1,50]] call SHK_pos;
				_unit setPos _tmpPos;
				_unit switchmove "AmovPercMstpSnonWnonDnon";
 			};
 		} forEach allUnits;
 	};
};

if (!hasInterface) exitWith {};

[{!isNull player}, {
	params ["_targetPosition"];
	_tmpPos = [_targetPosition,[0,10], random 360,0,[1,50]] call SHK_pos;
	player setPos [_tmpPos select 0, _tmpPos select 1, 0]; // force to ZERO height
	player switchmove "AmovPercMstpSnonWnonDnon";
}, [_targetPosition]] call CBA_fnc_waitUntilAndExecute;
