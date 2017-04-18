["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

[] execVM "zeus_modules\initZeusModules.sqf";
[] execVM "intro.sqf";
[] call grad_customGear_fnc_loadActions;
