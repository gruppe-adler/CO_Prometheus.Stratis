blufor_uniform_d = "ARC_GER_Tropentarn_Uniform";
blufor_uniform_w = "ARC_GER_Flecktarn_Uniform";


customGoggles = [
"TRYK_Beard_BK",
"TRYK_Beard",
"TRYK_Beard_BW",
"TRYK_Beard_Gr",
"TRYK_Beard_BK2"
] call BIS_fnc_selectRandom;

if (str player == "Alpha-Kilo") then {
	blufor_helmet = "ARC_Common_MEF_Helmet_G";
};

if (str player == "Fusselwurm") then {
	customGoggles = "L_Shemagh_Red";
};



// woodland camo?
if (woodland) then {
	blufor_uniform = blufor_uniform_w;

	blufor_helmet = "ARC_GER_Flecktarn_Helmet_simple";

	bluforVest = "ARC_GER_Flecktarn_PlateCarrier_1";
	vest_sql = "ARC_GER_Flecktarn_Plate_Carrier_H";
	vest_mg = "ARC_GER_Flecktarn_HPC_GL";
	vest_ftl = "ARC_GER_Flecktarn_PlateCarrier_2";
	helmet_sql = "ARC_GER_Flecktarn_Milcap";
	helmet_marksman = "ARC_GER_Flecktarn_booniehat";

	blufor_backpack = "ARC_GER_Backpack_compact_Flecktarn";
} else {
	blufor_uniform = blufor_uniform_d;

	blufor_helmet = "ARC_GER_Tropentarn_Helmet_simple";

	bluforVest = "ARC_GER_Tropentarn_PlateCarrier_1";
	vest_sql = "ARC_GER_Tropentarn_Plate_Carrier_H";
	vest_mg = "ARC_GER_Tropentarn_HPC_GL";
	vest_ftl = "ARC_GER_Tropentarn_PlateCarrier_2";
	
	blufor_backpack = "ARC_GER_Backpack_compact_Tropentarn";
	helmet_sql = "ARC_GER_Tropentarn_Milcap";
	helmet_marksman = "ARC_GER_Tropentarn_booniehat";
};


blufor_random_primaryweapon = [
	"arifle_SPAR_01_blk_F"
];

set_hk416_ammo = {
	this = _this select 0;
	[this, "30Rnd_556x45_Stanag", 6] call addMagazinesToVest;
	[this, "30Rnd_556x45_Stanag_Tracer_Green", 6] call addMagazinesToBackpack;
};

set_hk417_ammo = {
	this = _this select 0;
	[this, "20Rnd_762x51_Mag", 6] call addMagazinesToVest;
	[this, "20Rnd_762x51_Mag", 6] call addMagazinesToBackpack;
};

blufor_random_mg = [
	"rhs_weap_m249_pip_L",
	"rhs_weap_m249_pip_L_para",
	"rhs_weap_m249_pip_L_vfg",
	"rhs_weap_m249_pip_S",
	"rhs_weap_m249_pip_S_para",
	"rhs_weap_m249_pip_S_vfg"
];

blufor_basic = {
	this = _this select 0;

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "ACE_Flashlight_KSF1", 1] call addItemsToUniform;
	[this, "ACE_key_west", 1] call addItemsToUniform;
	[this, "ACE_MapTools", 1] call addItemsToUniform;
	[this, "Chemlight_blue", 2] call addItemsToUniform;
	

	[this, "rhsusf_mag_17Rnd_9x19_JHP", 3] call addItemsToUniform;

	this addPrimaryWeaponItem "acc_flashlight";
	this addWeapon "rhsusf_weap_glock17g4";

	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_anprc148jem";
	
};

blufor_default = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform blufor_uniform;
	this addVest bluforVest;
	this addHeadgear blufor_helmet;
	this addBackpack blufor_backpack;

	[this] call set_hk416_ammo;
	
	[this, "SmokeShell", 1] call addMagazinesToVest;
	[this, "SmokeShellRed", 1] call addMagazinesToVest;
	[this, "HandGrenade", 2] call addMagazinesToVest;

	

	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addPrimaryWeaponItem "optic_Aco";

	[this] call blufor_basic;
};

blufor_sql = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform blufor_uniform;
	this addVest vest_sql;
	this addHeadgear helmet_sql;
	this addBackpack "tf_rt1523g_big_bwmod_tropen";

	

	[this, "rhs_mag_30Rnd_556x45_M855A1_Stanag", 6] call addMagazinesToVest;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "HandGrenade", 2] call addMagazinesToVest;

	[this] call set_hk416_ammo;

	[this, "1Rnd_HE_Grenade_shell", 8] call addMagazinesToBackpack;
	[this, "1Rnd_Smoke_Grenade_shell", 2] call addMagazinesToBackpack;
	[this, "1Rnd_SmokeRed_Grenade_shell", 2] call addMagazinesToBackpack;
	[this, "1Rnd_SmokeGreen_Grenade_shell", 2] call addMagazinesToBackpack;
	[this, "UGL_FlareWhite_F", 2] call addMagazinesToBackpack;
	[this, "UGL_FlareRed_F", 2] call addMagazinesToBackpack;
	


	this addWeapon "Binocular";
	this addWeapon "arifle_SPAR_01_GL_blk_F";
	this addPrimaryWeaponItem "optic_Aco";
	this addPrimaryWeaponItem "acc_flashlight";
	this linkItem "ItemGPS";
	this linkItem "ItemMap";

	[this] call blufor_basic;
};

blufor_ftl = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform blufor_uniform;
	this addVest vest_ftl;
	this addHeadgear blufor_helmet;
	this addBackpack "tf_rt1523g_big_bwmod_tropen";

	[this] call set_hk416_ammo;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "HandGrenade", 2] call addMagazinesToVest;

	this addWeapon "Binocular";
	this addWeapon "arifle_SPAR_01_GL_blk_F";
	this addPrimaryWeaponItem "optic_Aco";
	this addPrimaryWeaponItem "acc_flashlight";

	
	[this] call blufor_basic;

};

blufor_medic = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform blufor_uniform;
	this addVest bluforVest;
	this addHeadgear blufor_helmet;
	this addBackpack blufor_backpack;

	[this] call set_hk416_ammo;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "HandGrenade", 2] call addMagazinesToBackpack;

	
	[this, "ACE_fieldDressing", 40] call addMagazinesToBackpack;
	[this, "ACE_Morphine", 20] call addMagazinesToBackpack;
	[this, "ACE_epinephrine", 20] call addMagazinesToBackpack;



	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addPrimaryWeaponItem "optic_Aco";

	
	[this] call blufor_basic;

};

blufor_marksman = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform blufor_uniform;
	this addVest bluforVest;
	this addHeadgear helmet_marksman;
	this addBackpack blufor_backpack;

	[this] call set_hk417_ammo;
	
	[this, "SmokeShell", 1] call addMagazinesToVest;
	[this, "SmokeShellRed", 1] call addMagazinesToVest;
	[this, "HandGrenade", 1] call addMagazinesToVest;

	this addWeapon "Binocular";
	this addWeapon "arifle_SPAR_03_blk_F";
	this addPrimaryWeaponItem "SMA_supp_762";
	this addPrimaryWeaponItem "FHQ_acc_ANPEQ15_black";
	this addPrimaryWeaponItem "optic_Hamr";
	this addPrimaryWeaponItem "bipod_01_F_blk";

	
	[this] call blufor_basic;
	this linkItem "rhs_scarf";

};

blufor_AT = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform blufor_uniform;
	this addVest bluforVest;
	this addHeadgear blufor_helmet;
	this addBackpack blufor_backpack;

	[this] call set_hk416_ammo;

	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "HandGrenade", 1] call addMagazinesToVest;


	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addWeapon "rhs_weap_M136_hedp";

	
	[this] call blufor_basic;

};

blufor_MG = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform blufor_uniform;
	this addVest vest_mg;
	this addHeadgear blufor_helmet;
	this addBackpack blufor_backpack;


	[this, "rhs_200rnd_556x45_T_SAW", 2] call addMagazinesToBackpack;
	[this, "rhs_200rnd_556x45_M_SAW", 6] call addMagazinesToBackpack;
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "HandGrenade", 1] call addMagazinesToVest;


	this addWeapon "Binocular";
	this addWeapon (blufor_random_mg call BIS_fnc_selectRandom);

	[this] call blufor_basic;

};



blufor_engineer = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform blufor_uniform;
	this addVest bluforVest;
	this addHeadgear blufor_helmet;
	this addBackpack blufor_backpack;

	
	[this] call set_hk416_ammo;
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "HandGrenade", 1] call addMagazinesToVest;


	[this, "ACE_wirecutter", 1] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addPrimaryWeaponItem "optic_Aco";

	
	[this] call blufor_basic;
};

blufor_crew = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform blufor_uniform;
	this addVest bluforVest;
	this addHeadgear blufor_helmet;
	this addBackpack blufor_backpack;

	[this] call set_hk416_ammo;
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "HandGrenade", 1] call addMagazinesToVest;

	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addPrimaryWeaponItem "optic_Aco";

	
	[this] call blufor_basic;

};


blufor_ammobearer = {
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform blufor_uniform;
	this addVest bluforVest;
	this addHeadgear blufor_helmet;
	this addBackpack blufor_backpack;

	
	[this] call set_hk416_ammo;
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "HandGrenade", 1] call addMagazinesToVest;

	[this, "rhs_200rnd_556x45_T_SAW", 2] call addMagazinesToBackpack;
	[this, "rhs_200rnd_556x45_M_SAW", 6] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addPrimaryWeaponItem "optic_Aco";

	
	[this] call blufor_basic;
};
