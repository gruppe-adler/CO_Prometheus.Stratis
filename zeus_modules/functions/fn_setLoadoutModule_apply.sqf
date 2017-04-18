params ["_sidePrefix","_selLoadout","_selSide"];

[_sidePrefix, _selLoadout] call GRAD_Loadout_fnc_FactionSetLoadout;
{
    if (local _x && side _x == _selSide) then {
        [_x] call GRAD_Loadout_fnc_doLoadoutForUnit;
    };
    false
} count allUnits;

if (playerSide == _selSide) then {
    [] call grad_customGear_fnc_loadActions;
};
