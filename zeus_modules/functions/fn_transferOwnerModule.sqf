params ["_pos",["_unit",objNull]];

if (isNull _unit) exitWith {["Fehlgeschlagen: Keine Einheit ausgewählt."] call ares_fnc_showZeusMessage};
if (isPlayer _unit) exitWith {[format ["Fehlgeschlagen: %1 ist keine KI.", name _unit]] call ares_fnc_showZeusMessage};

private _selections = ["Player","Server","Headless"];
private _result = ["Gruppenbesitzer auswählen",
[
    ["Owner", _selections, "Headless"]
]] call Ares_fnc_showChooseDialog;
if (count _result == 0) exitWith {};

_result params ["_ownerID"];
private _ownerSelection = _selections select _ownerID;

switch (_ownerSelection) do {
    case ("Player"): {
        { _x setVariable ["GRAD_dontTransferToHC", true, true]; } forEach units group _unit;
        [[player,group _unit],{ _owner = owner (_this select 0); (_this select 1) setGroupOwner _owner; }] remoteExec ["BIS_fnc_spawn",2];
        [format ["%1 an Spieler übertragen.", group _unit]] call ares_fnc_showZeusMessage;
    };

    case ("Server"): {
        { _x setVariable ["GRAD_dontTransferToHC", true, true]; } forEach units group _unit;
        [[group _unit],{(_this select 0) setGroupOwner 2}] remoteExec ["BIS_fnc_spawn",2];
        [format ["%1 an Server übertragen.", group _unit]] call ares_fnc_showZeusMessage;
    };

    case ("Headless"): {
    	{ _x setVariable ["GRAD_dontTransferToHC",false, true]; } forEach units group _unit;

    	_connectedHeadlesses = entities "HeadlessClient_F";
    	if (count _connectedHeadlesses > 0) then {
	 		(group _unit) setGroupOwner (owner (_connectedHeadlesses select 0));
            [format ["%1 an %2 übertragen.", group _unit, name (_connectedHeadlesses select 0)]] call ares_fnc_showZeusMessage;
    	} else {
            ["Fehlgeschlagen: Kein Headless Client verbunden."] call ares_fnc_showZeusMessage;
        };
    };
};
