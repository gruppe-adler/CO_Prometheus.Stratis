#include "..\defines.hpp"

private _message = ctrlText PROMETHEUS_DIALOG_EDITBOX;
closeDialog PROMETHEUS_MESSAGEZEUS_DIALOG;

[profileName,_message] remoteExec ["prometheus_ui_fnc_receiveZeusMessage",0,false];
