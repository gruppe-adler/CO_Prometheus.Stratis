params ["_position",["_selObject",objNull]];

if (isNull _selObject) exitWith {[objNull, "Fehler: Keine Gruppe ausgewählt."] call bis_fnc_showCuratorFeedbackMessage};

private _group = group _selObject;
if (isNull _group) exitWith {[objNull, "Fehler: Objekt hat keine Gruppe."] call bis_fnc_showCuratorFeedbackMessage};


private _curStatus = _group getVariable ["ACE_map_hideBlueForceMarker",false];
_group setVariable ["ACE_map_hideBlueForceMarker", !_curStatus, true];

[objNull, format ["Blue Force Tracking für %1 %2.",_group,if (_curStatus) then {"eingeschaltet"} else {"ausgeschaltet"}]] call bis_fnc_showCuratorFeedbackMessage;
