params ["_sidePrefix", "_selLoadout","_selNVGs"];

[_sidePrefix, _selLoadout] call GRAD_Loadout_fnc_FactionSetLoadout;
private _allLocalUnits = allUnits select {local _x};
{
    removeAllAssignedItems _x;
    [_x] call GRAD_Loadout_fnc_doLoadoutForUnit;
    _x linkItem _selNVGs;
    false
} count _allLocalUnits;
