#include "..\defines.hpp"

if (isNull curatorCamera) exitWith {};

"prometheus_zeusMessage_receiveLayer" cutRsc ["prometheus_messageZeus_title", "PLAIN", 2];

[{!isNil {uiNamespace getVariable "prometheus_messageZeus_title"} && {!(isNull (uiNamespace getVariable "prometheus_messageZeus_title"))}}, {
    params ["_senderName","_message"];

    _display = uiNamespace getVariable "prometheus_messageZeus_title";
    _topbar = _display displayCtrl PROMETHEUS_MESSAGEZEUS_TITLEBAR;
    _textBox = _display displayCtrl PROMETHEUS_MESSAGEZEUS_TEXT;

    _topbar ctrlSetText format ["NACHRICHT VON %1",toUpper _senderName];
    _textBox ctrlSetStructuredText parseText _message;
}, _this] call CBA_fnc_waitUntilAndExecute;
