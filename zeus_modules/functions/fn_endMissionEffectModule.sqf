private _result = ["Erstellt 'Mission Beendet' Effekt ohne Mission zu beenden",
[
    ["Mission erfolgreich", ["nein","ja"], 1],
    ["Musik abspielen", ["nein","ja"], 1],
    ["Tasks abschließen", ["nein","ja"], 1]
]] call Ares_fnc_showChooseDialog;
if (count _result == 0) exitWith {};

_result params ["_successfulID","_playMusicID","_completeTasksID"];
[_successfulID == 1, _playMusicID == 1, _completeTasksID ==1] remoteExec ["prometheus_zeus_fnc_endMissionEffectModule_effect",0,false];
