params ["_pos"];

if (!isServer) exitWith {};

_arsenal = "B_CargoNet_01_ammo_F" createVehicle (_pos);
_arsenal setPos _pos;
_arsenal allowDamage false;

clearBackpackCargoGlobal _arsenal;
clearItemCargoGlobal _arsenal;
clearMagazineCargoGlobal _arsenal;
clearWeaponCargoGlobal _arsenal;

["AmmoboxInit",[_arsenal,true]] remoteExec ["BIS_fnc_arsenal",0,true];
