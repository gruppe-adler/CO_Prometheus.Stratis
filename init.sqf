#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

_woodland = ["woodland",true] call prometheus_fnc_getIslandCfgEntry;
["BLU_F", missionNamespace getVariable ["prometheus_factionLoadout"+"BLU_F",if (_woodland) then {"UsMPT"} else {"UsOCP"}]] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", missionNamespace getVariable ["prometheus_factionLoadout"+"OPF_F",if (_woodland) then {"RuFlora"} else {"RuMedit"}]] call GRAD_Loadout_fnc_FactionSetLoadout;
["IND_F", missionNamespace getVariable ["prometheus_factionLoadout"+"IND_F",if (_woodland) then {"BwFleck"} else {"BwTrop"}]] call GRAD_Loadout_fnc_FactionSetLoadout;


// read parameters
TIME_OF_DAY = paramsArray select 0;
WEATHER_SETTING = paramsArray select 1;
TIME_ACCELERATION = paramsArray select 2;
AR3PLAY_ENABLE_REPLAY = (paramsArray select 3) == 1;
AR3PLAY_IS_STREAMABLE = (paramsArray select 4) == 1;
DEBUG = (paramsArray select 5) == 1;

setCustomWeather = {
	skipTime -24;
	0 setOvercast (_this select 0);
	setViewDistance 5000;
	skipTime 24;
};

switch (WEATHER_SETTING) do {
	case 0: {[0] call setCustomWeather;};
	case 1: {[0.4] call setCustomWeather;};
	case 2: {[1] call setCustomWeather;};
	case 3: {[random 1] call setCustomWeather;};
	default {[0] call setCustomWeather;};
};


if (!isMultiplayer) then { // Editor
	{_x disableAI "MOVE"} forEach allUnits;
};

enableSentences false;
enableRadio false;

//when headless param is set, then
if ((paramsArray select 6) == 1) then {
		// Werthles Headless Script Parameters v2.3
	// 1. Repeating - true/Once - false,
	// 2. Time between repeats (seconds),
	// 3. Debug available for all - true/Just available for admin/host - false,
	// 4. Advanced balancing - true/Simple balancing - false,
	// 5. Delay before executing (seconds),
	// 6. Additional syncing time between groups transferred to try to reduce bad unit transfer caused by desyncs (seconds)
	// 7. Display an initial setup report after the first cycle, showing the number of units moved to HCs,
	// 8. Addition phrases to look for when checking whether to ignore.
	// Unit names, group names, unit's current transport vehicle, modules synced to units and unit class names will all be checked for these phrases
	// Format:
	// ["UnitName","GroupCallsignName","SupportProviderModule1","TypeOfUnit"]
	// E.g. ["BLUE1","AlphaSquad","B_Heli_Transport_01_camo_F"] (including ""s)
	// Specifying "B_Heli" would stop all units with that class type from transferring to HCs
	// However, if you specify "BLUE1", "NAVYBLUE10" will also be ignored

	[true,30,false,true,30,3,true,[]] execVM "headless\WerthlesHeadless.sqf";
};

if (isServer) then {

	["Initialize"] call BIS_fnc_dynamicGroups;

	// set to full moon date
	setDate [2015, 2, 2, TIME_OF_DAY, 1];
	// set time acceleration
	setTimeMultiplier TIME_ACCELERATION;



	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
		[] execVM "tfarsettings.sqf";
	};

 	[] execVM "helpers\medical_settings.sqf";
};

diag_log format ["setup: server done"];

// [] execVM "CSSA3\CSSA3_init.sqf";

//SHK POS
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";

clearInventory = compile preprocessFile "helpers\clearInventory.sqf";

[] execVM "setup\adjustInitialSpawnPosition.sqf";
