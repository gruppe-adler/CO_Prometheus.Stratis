// just to be sure
if (!isServer) exitWith {};

_pos = _this select 0;

// flecktarn
_ger_flecktarn_loadouts = [
["Flecktarn Loadouts"],
[
["ger_fleck_default","Grundausrüstung ohne Waffe"],
["ger_fleck_medic","Sanitäter"],
["ger_fleck_marksman","Gruppenscharfschütze"],
["ger_fleck_lmg","LMG"],
["ger_fleck_grenadier","Grenadier"],
["ger_fleck_rifleman","Schütze"]
]
];

// tropentarn
_ger_tropentarn_loadouts = [
["Tropentarn Loadouts"],
[
["ger_tropen_default","Grundausrüstung ohne Waffe"],
["ger_tropen_medic","Sanitäter"],
["ger_tropen_marksman","Gruppenscharfschütze"],
["ger_tropen_lmg","LMG"],
["ger_tropen_grenadier","Grenadier"],
["ger_tropen_rifleman","Schütze"]
]
];

// US OCP
_us_ocp_loadouts = [
["OCP Loadouts"],
[
["us_ocp_default","Grundausrüstung ohne Waffe"],
["us_ocp_medic","Sanitäter"],
["us_ocp_marksman","Gruppenscharfschütze"],
["us_ocp_lmg","LMG"],
["us_ocp_grenadier","Grenadier"],
["us_ocp_rifleman","Schütze"]
]
];

// US UCP
_us_ucp_loadouts = [
["UCP Loadouts"],
[
["us_ucp_default","Grundausrüstung ohne Waffe"],
["us_ucp_medic","Sanitäter"],
["us_ucp_marksman","Gruppenscharfschütze"],
["us_ucp_lmg","LMG"],
["us_ucp_grenadier","Grenadier"],
["us_ucp_rifleman","Schütze"]
]
];



// array aller loadouts
_loadouts = [_ger_flecktarn_loadouts,_ger_tropentarn_loadouts,_us_ocp_loadouts,_us_ucp_loadouts];


/* 
 -- dont edit below here! --
*/
_clearContent = {
	_boxToClear = _this select 0;
	clearItemCargoGlobal _boxToClear;	
	clearBackpackCargoGlobal _boxToClear;	
	clearWeaponCargoGlobal _boxToClear;	
	clearMagazineCargoGlobal _boxToClear;	
};



_addAction = {
	_actionBox = _this select 0;
	_actionLoadout = _this select 1;

	_actionTitle = _actionLoadout select 0;
	_loadoutArray = _actionLoadout select 1;
	diag_log format ["_actionTitle of 0 is %1",_actionTitle select 0];
	diag_log format ["_loadoutArray of 0 is %1",(_loadoutArray select 0) select 1];

	[[_actionBox,"<t color=""#6caacc"">" + (_actionTitle select 0),"loadouts\automatic_loadouts\hintOnlyHeadline.sqf"],"grad_addactionMP",nil,false] spawn BIS_fnc_MP;
	{
		_loadoutDescription = _x select 1;
		_path = _x select 0;
		diag_log format ["descr is %1",_loadoutDescription];
		diag_log format ["path is %1",_path];

		_pathToLoadout = "loadouts\automatic_loadouts\" + _path + ".sqf";
		[[_actionBox,"<t color=""#93E352"">" + _loadoutDescription,_pathToLoadout],"grad_addactionMP",true,false] spawn BIS_fnc_MP;

	} forEach _loadoutArray;
};

_createCrate = {
	_centerpos = _this select 0;
	_loadout = _this select 1;
	

	_calcPos = [_centerpos, [5,15],random 360] call SHK_pos;
	_newbox = createVehicle ["Box_NATO_Ammo_F", _calcPos, [], 0, "NONE"];

	// diag_log format ["_newbox created at %1", _calcPos];
	// diag_log format ["_content will be %1", _loadout];
	[_newbox] call _clearContent;
	[_newbox,_loadout] call _addAction;
};



// create circle of boxes
{
	[_pos,_x] call _createCrate;

} forEach _loadouts;