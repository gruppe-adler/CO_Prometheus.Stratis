params ["_position","_selObject"];

private _sides = [WEST,EAST,INDEPENDENT,CIVILIAN];
private _sideStr = _sides apply {str _x};
private _defaultSide = (_sides find (side _selObject)) max 0;
private _loadouts = "true" configClasses (missionConfigFile >> "Loadouts" >> "Faction");
private _loadoutsStr = _loadouts apply {configName _x};
private _allNVGs = "configName _x isKindOf ['NVGoggles',configFile >> 'CfgWeapons']" configClasses (configFile >> "CfgWeapons");
private _allNVGsStr = [""] + (_allNVGs apply {configName _x});
private _allNVGsDisplayNames = ["KEINE"] + (_allNVGs apply {[_x >> "displayName","text","ERROR"] call CBA_fnc_getConfigEntry});

private _result = ["Loadouts festlegen",
[
    ["Seite", _sideStr, _defaultSide],
    ["Loadout", _loadoutsStr, 0],
    ["Nightvision", _allNVGsDisplayNames, 0]
]] call Ares_fnc_showChooseDialog;

if (count _result == 0) exitWith {};

_result params ["_sideID","_loadoutID","_nvgID"];
private _selSide = _sides select _sideID;
private _sidePrefix = ["BLU_F","OPF_F","IND_F","CIV_F"] select _sideID;
private _selLoadout = _loadoutsStr select _loadoutID;
private _selNVGs = _allNVGsStr select _nvgID;

[_sidePrefix, _selLoadout,_selNVGs] remoteExec ["prometheus_zeus_fnc_setLoadoutModule_apply",0,true];
