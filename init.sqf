#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"


// islandconfig must be before initgui!
call compile preprocessFile "islandConfig.sqf";

// read parameters
TIME_OF_DAY = paramsArray select 0;
WEATHER_SETTING = paramsArray select 1;
TIME_ACCELERATION = paramsArray select 6;
AR3PLAY_ENABLE_REPLAY = (paramsArray select 8) == 1;
AR3PLAY_IS_STREAMABLE = (paramsArray select 9) == 1;



setCustomWeather = {
	skipTime -24; 
	0 setOvercast (_this select 0); 
	setViewDistance 7000;
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
	/* {_x disableAI "MOVE"} forEach allUnits;*/
};



if (isServer) then {
	// allow view distance to be up to 10k
	
	// set to full moon date
	setDate [2015, 2, 2, TIME_OF_DAY, 1];
	// set time acceleration
	setTimeMultiplier TIME_ACCELERATION;

	
	
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
		[] execVM "tfarsettings.sqf";
	};
	
 	[] execVM "helpers\medical_settings.sqf";

 	[] spawn {
 		{if (!isPlayer _x) then {sleep 0.5; [_x] execVM "loadouts\_client.sqf"};} forEach allUnits;
 	};
 	
};
diag_log format ["setup: server done"];

[] execVM "CSSA3\CSSA3_init.sqf";
[REPLAY_ACCURACY] execVM "GRAD_replay\GRAD_replay_init.sqf";

clearInventory = compile preprocessFile "helpers\clearInventory.sqf";
spawnStuff = compile preprocessFile "helpers\spawnStuff.sqf";
//SHK POS
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
// findsimplePos
call compile preprocessFileLineNumbers "helpers\findSimplePos.sqf";
call compile preprocessFileLineNumbers "helpers\spawnBluforHQ.sqf";


If(isNil "spawn_help_fnc_compiled") then { call compile preprocessFileLineNumbers "helpers\findPos.sqf"; }; // TODO why the if condition here?

diag_log format ["setup: clientandserver done"];

if (hasInterface) then {

	player allowDamage false;
	[] execVM "player\setup\adjustInitialSpawnPosition.sqf"; diag_log format ["setup: initial spawn position initiated"];

	checkJIP = {
		if ((OPFOR_TELEPORT_TARGET select 0 != 0) && didJIP && time > jipTime) then {
			player setDamage 1;
			["forced"] spawn CSSA3_fnc_createSpectateDialog;
		} else {
		if (!didJIP) exitWith {[] call checkSpawnButton;};
			if (playerSide == east) then {
			[OPFOR_TELEPORT_TARGET, 50] execVM "helpers\teleportPlayer.sqf";
			} else {
			[BLUFOR_TELEPORT_TARGET, 50] execVM "helpers\teleportPlayer.sqf";
			};
		};
	};


	checkSpawnButton = {
		[getPos player] execVM "helpers\enforceNoSwim.sqf";
		
		if (player != opfor_teamlead) then {
			0 = [[worldSize/2,worldSize/2,0],"",3000] execVM "helpers\establishingShot.sqf";
		} else {
		disableSerialization;
		waitUntil {!(isNull ([] call BIS_fnc_displayMission))};
			cheffeKeyEH = ([] call BIS_fnc_displayMission) displayAddEventHandler [
				"KeyDown",
				format ["	
						if (OPFOR_TELEPORT_TARGET select 0 != 0) then {
							([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', cheffeKeyEH];
							
							playSound ['click', true];

						};

						if (_this select 1 != 1) then {0 = createDialog 'gui_spawn_opfor'; true};
					"]
			];
			0 = createDialog "gui_spawn_opfor";
			waitUntil {(OPFOR_TELEPORT_TARGET select 0 != 0)};
			([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', cheffeKeyEH];
		};
	};

	
	

	enableSentences false;

	
	[] execVM "player\intro.sqf"; diag_log format ["setup: intro initiated"];

	[] execVM "player\setup\helpBriefing.sqf"; diag_log format ["setup: briefing initiated"];

	

	
	[] execVM "player\allXXXSurrenderedListener.sqf"; diag_log format ["setup: surrenderlistener initiated"];
	// [player] execVM "loadouts\_client.sqf"; 
	[] spawn {
		sleep (random 10);
		[player] execVM "loadouts\_client.sqf"; diag_log format ["setup: loadout %1 initiated",player];
	};
	

	[] execVM "spawn\hedgehogAssemblingSystem.sqf";
	[] execVM "spawn\addInteractions.sqf";
	
	if (playerSide == west) then {
		[] execVM "player\russianMarker.sqf"; 
		[] execVM "player\bluforOpforTeleportListener.sqf";
		[] execVM "player\bluforBluforTeleportListener.sqf";
		[] execVM "player\bluforRussianPointsListener.sqf";
		[] spawn checkJIP;
	};

	if (playerSide == east) then {
		[] execVM "player\russianMarker.sqf"; diag_log format ["setup: russianmarker initiated"];
		[] execVM "player\opforBluforTeleportListener.sqf"; diag_log format ["setup: opforBluforTeleportListener initiated"];
		[] execVM "player\opforOpforTeleportListener.sqf"; diag_log format ["setup: opforOpforTeleportListener initiated"];
		[] execVM "player\bluforRussianPointsListener.sqf";
		[] spawn checkJIP; diag_log format ["setup: createStartHints initiated"];
	};

	/*waitUntil {!isNull player && !isNil "ST_STHud_ToRestart"};
	// disable sthud for intro
	0 call fn_sthud_usermenu_changeMode;*/
};