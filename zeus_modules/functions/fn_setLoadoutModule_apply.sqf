params ["_sidePrefix", "_selLoadout"];

[_sidePrefix, _selLoadout] call GRAD_Loadout_fnc_FactionSetLoadout;
private _allLocalUnits = allUnits select {local _x};
{
    [_x] call GRAD_Loadout_fnc_doLoadoutForUnit;
    false
} count _allLocalUnits;
