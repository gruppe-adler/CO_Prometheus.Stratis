params ["_position",["_selObject",objNull]];

private _sides = [WEST,EAST,INDEPENDENT,CIVILIAN];
private _sideStr = _sides apply {str _x};
private _defaultSide = (_sides find (side _selObject)) max 0;

private _result = ["Bündnisse festlegen",
[
    ["Seite", _sideStr, _defaultSide, true],
    ["mit", _sideStr, _defaultSide, false],
    ["verbündet",["nein","ja"],1]
]] call Ares_fnc_showChooseDialog;

if (count _result == 0) exitWith {};

_result params ["_side1ID","_side2ID","_friendliness"];
private _side1 = _sides select _side1ID;
private _side2 = _sides select _side2ID;

_side1 setFriend [_side2,_friendliness];
_side2 setFriend [_side1,_friendliness];
