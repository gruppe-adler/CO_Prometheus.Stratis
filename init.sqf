#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"


// islandconfig must be before initgui!
call compile preprocessFile "islandConfig.sqf";

// read parameters
TIME_OF_DAY = paramsArray select 0;
WEATHER_SETTING = paramsArray select 1;
TIME_ACCELERATION = paramsArray select 2;
AR3PLAY_ENABLE_REPLAY = (paramsArray select 3) == 1;
AR3PLAY_IS_STREAMABLE = (paramsArray select 4) == 1;
if ((paramsArray select 0) == 1) then {woodland = true;} else {woodland = false;};



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



if (isServer) then {

	execVM "headless\passToHCs.sqf";

	["Initialize"] call BIS_fnc_dynamicGroups;
	
	// set to full moon date
	setDate [2015, 2, 2, TIME_OF_DAY, 1];
	// set time acceleration
	setTimeMultiplier TIME_ACCELERATION;

	
	
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
		[] execVM "tfarsettings.sqf";
	};
	
 	[] execVM "helpers\medical_settings.sqf";

 	[] spawn {
 		{if (!isPlayer _x) then {sleep 0.2; [_x] execVM "loadouts\_client.sqf"};} forEach allUnits;
 	};
};

diag_log format ["setup: server done"];

// [] execVM "CSSA3\CSSA3_init.sqf";

//SHK POS
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";

clearInventory = compile preprocessFile "helpers\clearInventory.sqf";

[] execVM "setup\adjustInitialSpawnPosition.sqf"; diag_log format ["setup: initial spawn position initiated"];	

if (hasInterface) then {
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
	

	enableSentences false;
	
	[player] execVM "loadouts\_client.sqf"; diag_log format ["setup: loadout %1 initiated",player];
	[] execVM "helpers\intro.sqf";
};