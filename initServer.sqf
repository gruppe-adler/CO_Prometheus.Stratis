["Initialize"] call BIS_fnc_dynamicGroups;

if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
    [] execVM "tfarsettings.sqf";
};
