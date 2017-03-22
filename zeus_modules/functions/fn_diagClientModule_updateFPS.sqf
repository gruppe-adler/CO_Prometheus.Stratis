/*  written by DriftingNitro
*   modified by McDiod
*/

params ["_onOff"];

prometheus_zeus_updateFPS = _onOff;
if !(prometheus_zeus_updateFPS) exitWith {};

if (missionNamespace getVariable ["prometheus_zeus_updateFPS_running",false]) exitWith {};
prometheus_zeus_updateFPS_running = true;

[{
    params ["_args","_handle"];
    if !(prometheus_zeus_updateFPS) exitWith {prometheus_zeus_updateFPS_running = false; [_handle] call CBA_fnc_removePerFrameHandler};

    player setVariable ["prometheus_zeus_playerFPS", round diag_fps, true];
} , 1, []] call CBA_fnc_addPerFrameHandler;
