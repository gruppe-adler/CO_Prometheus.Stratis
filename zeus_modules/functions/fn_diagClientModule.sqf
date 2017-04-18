missionNamespace setVariable ["prometheus_zeus_updateFPS",!(missionNamespace getVariable ["prometheus_zeus_updateFPS",false]),true];

if (prometheus_zeus_updateFPS) then {[prometheus_zeus_updateFPS] remoteExec ["prometheus_zeus_fnc_diagClientModule_updateFPS",0,false]};
[prometheus_zeus_updateFPS] remoteExec ["prometheus_zeus_fnc_diagClientModule_drawFPS",0,false];

[objNull, format ["Client FPS Anzeige für alle Zeuse %1.",_group,if (prometheus_zeus_updateFPS) then {"eingeschaltet"} else {"ausgeschaltet"}]] call bis_fnc_showCuratorFeedbackMessage;
