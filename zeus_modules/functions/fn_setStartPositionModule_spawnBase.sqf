/*
Simmax - Spawn Camp
Version 0.7
21.12.2016
*/

params ["_pos","_pos_dir","_spawnArsenal"];

if (!isServer) exitWith {};

// Objekte
_camp_cutter_1 = "Land_ClutterCutter_medium_F" createVehicle (_pos);
_camp_cutter_1 setDir (_pos_dir);
_camp_cutter_2 = "Land_ClutterCutter_large_F" createVehicle (_pos);
_camp_cutter_2 setDir (_pos_dir);
_camp_cutter_2 setPos (_camp_cutter_1 modelToWorld [-3.5,6,0]);

_camp_fire_1 = "Land_Campfire_F" createVehicle (_pos);
_camp_fire_1 setDir (_pos_dir);
_camp_fire_1 allowDamage false;

_camp_zelt_1 = "CamoNet_OPFOR_F" createVehicle (_pos);
_camp_zelt_1 setPos (_camp_cutter_1 modelToWorld [-2,6,0]);
_camp_zelt_1 setDir (_pos_dir);
_camp_zelt_1 allowDamage false;

_camp_kiste_1 = "Box_FIA_Wps_F" createVehicle (_pos);
_camp_kiste_1 setPos (_camp_cutter_1 modelToWorld [2,5,0]);
_camp_kiste_1 setDir (_pos_dir);
_camp_kiste_1 allowDamage false;

if (_spawnArsenal) then {["AmmoboxInit",[_camp_kiste_1,true]] remoteExec ["BIS_fnc_arsenal",0,true]};
clearBackpackCargoGlobal _camp_kiste_1;
clearItemCargoGlobal _camp_kiste_1;
clearMagazineCargoGlobal _camp_kiste_1;
clearWeaponCargoGlobal _camp_kiste_1;

_camp_kiste_2 = "Box_FIA_Support_F" createVehicle (_pos);
_camp_kiste_2 setPos (_camp_cutter_1 modelToWorld [-0.5,6.5,0]);
_camp_kiste_2 setDir (_pos_dir) -30;
_camp_kiste_2 allowDamage false;

clearBackpackCargoGlobal _camp_kiste_2;
clearItemCargoGlobal _camp_kiste_2;
clearMagazineCargoGlobal _camp_kiste_2;
clearWeaponCargoGlobal _camp_kiste_2;

_camp_tisch_1 = "Land_CampingTable_F" createVehicle (_pos);
_camp_tisch_1 setPos (_camp_cutter_1 modelToWorld [-4.5,6,0]);
_camp_tisch_1 setDir (_pos_dir);
_camp_tisch_1 allowDamage false;

_camp_stuhl1 = "Land_CampingChair_V2_F" createVehicle (_pos);
_camp_stuhl1 setPos (_camp_cutter_1 modelToWorld [-6.4,6,0]);
_camp_stuhl1 setDir (_pos_dir) -80;
_camp_stuhl1 allowDamage false;

_camp_stuhl2 = "Land_CampingChair_V2_F" createVehicle (_pos);
_camp_stuhl2 setPos (_camp_cutter_1 modelToWorld [-2.7,6,0]);
_camp_stuhl2 setDir (_pos_dir) +30;
_camp_stuhl2 allowDamage false;

_camp_stuhl3 = "Land_CampingChair_V2_F" createVehicle (_pos);
_camp_stuhl3 setPos (_camp_cutter_1 modelToWorld [-4.9,7.2,0]);
_camp_stuhl3 setDir (_pos_dir) +10;
_camp_stuhl3 allowDamage false;

_light0 = "#lightpoint" createVehicle (_pos);
_light0 setLightColor[1, 1, 0.3];
_light0 setLightBrightness 0.25;
_light0 setLightAmbient [0.09,0.09,0.09];
_light0 lightAttachObject [_camp_zelt_1, [2,-1,1.5]];
