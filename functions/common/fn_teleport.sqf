/*    Teleports unit
*
*     Params:
*     0:    unit
*     1:    destination
*/

params ["_unit",["_pos", [0,0,0]],["_code",{}],["_codeParams",[]]];

if (!local _unit) exitWith {};

_unit allowDamage false;
_unit setPos _pos;
[{
    params ["_unit","_code","_codeParams"];
    _unit allowDamage true;
    _codeParams call _code;
}, [_unit,_code,_codeParams], 2] call CBA_fnc_waitAndExecute;
