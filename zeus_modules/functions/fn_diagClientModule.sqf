missionNamespace setVariable ["prometheus_zeus_updateFPS",!(missionNamespace getVariable ["prometheus_zeus_updateFPS",false]),true];

if (prometheus_zeus_updateFPS) then {[prometheus_zeus_updateFPS] remoteExec ["prometheus_zeus_fnc_diagClientModule_updateFPS",0,true]};
[prometheus_zeus_updateFPS] remoteExec ["prometheus_zeus_fnc_diagClientModule_drawFPS",0,true];
