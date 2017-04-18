params ["_position",["_selObject",objNull]];

private _sides = [WEST,EAST,INDEPENDENT,CIVILIAN];
private _sideStr = _sides apply {str _x};
private _defaultSide = (_sides find (side _selObject)) max 0;
private _loadouts = "true" configClasses (missionConfigFile >> "Loadouts" >> "Faction");
private _loadoutsStr = _loadouts apply {configName _x};

private _result = ["Loadouts festlegen",
[
    ["Seite", _sideStr, _defaultSide, true],
    ["Loadout", _loadoutsStr, 0]
]] call Ares_fnc_showChooseDialog;

if (count _result == 0) exitWith {};

_result params ["_sideID","_loadoutID"];
private _selSide = _sides select _sideID;
private _sidePrefix = ["BLU_F","OPF_F","IND_F","CIV_F"] select _sideID;
private _selLoadout = _loadoutsStr select _loadoutID;

missionNamespace setVariable ["prometheus_factionLoadout"+_sidePrefix,_selLoadout,true];
[_sidePrefix, _selLoadout,_selSide] remoteExec ["prometheus_zeus_fnc_setLoadoutModule_apply",0,false];
