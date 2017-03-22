params ["_sidePrefix", "_selLoadout"];

[_sidePrefix, _selLoadout] call GRAD_Loadout_fnc_FactionSetLoadout;
{
    if (local _x) then {
        [_x] call GRAD_Loadout_fnc_doLoadoutForUnit;
    };
    false
} count allUnits;
