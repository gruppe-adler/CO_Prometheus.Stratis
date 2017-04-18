if !(missionNamespace getVariable ["prometheus_zeus_updateFPS",false]) exitWith {};

[true] call prometheus_zeus_fnc_diagClientModule_updateFPS;
[true] call prometheus_zeus_fnc_diagClientModule_drawFPS;
