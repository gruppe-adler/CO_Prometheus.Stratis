params ["_position",["_selObject",objNull]];

private _sides = [WEST,EAST,INDEPENDENT];
private _sideStr = _sides apply {str _x};

private _result = ["Startposition festlegen",
[
    ["Seite", _sideStr, 0],
    ["Basis spawnen", ["nein","ja"], 1],
    ["Arsenal spawnen", ["nein","ja"],1]
]] call Ares_fnc_showChooseDialog;

if (count _result == 0) exitWith {};

_result params ["_sideID","_baseID","_arsenalID"];
private _selSide = _sides select _sideID;
private _spawnBase = _baseID == 1;
private _spawnArsenal = _arsenalID == 1;

//move respawn markers
switch (_selSide) do {
    case (WEST): {
        missionNamespace setVariable ["prometheus_startPosBlu",_position,true];
        "respawn_west" setMarkerPos _position;
    	"respawn_civilian" setMarkerPos _position;
    };
    case (EAST): {
        missionNamespace setVariable ["prometheus_startPosOpf",_position,true];
        "respawn_east" setMarkerPos _position;
    };
    case (INDEPENDENT): {
        missionNamespace setVariable ["prometheus_startPosInd",_position,true];
        "respawn_guerrila" setMarkerPos _position;
    };
};

//spawn base
if (_spawnBase) then {[_position,0] remoteExec ["prometheus_zeus_fnc_setStartPositionModule_spawnBase",2,false]};

//teleport units
{
    if (side _x == _selSide && !isNull _x) then {
        [{
            params ["_position","_unit"];
            _tmpPos = [_position,[0,10], random 360,0,[1,50]] call SHK_pos;
            [_unit,_tmpPos] remoteExec ["prometheus_fnc_teleport",_unit,false];
        }, [_position,_x], (random 2) + 2] call CBA_fnc_waitAndExecute;
    };
} forEach allPlayers;
