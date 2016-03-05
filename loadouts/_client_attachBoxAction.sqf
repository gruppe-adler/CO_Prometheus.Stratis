private["_object","_name","_scriptToCall"];

_object = _this select 0;
_name = _this select 1;
_scriptToCall = _this select 2;

if(isNull _object) exitWith {};

_object addaction [_name, _scriptToCall, _Args, 10, false, true, "",""];