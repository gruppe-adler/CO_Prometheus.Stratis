/*
 * aitohc.sqf
 *
 * By VCRPlayer
 *
 * This script will move ANY ai (ie: zeus-spawned, etc)         to the headless client for processing on every frame
 * 
 * In init.sqf, put "[] execVM "aitohc.sqf";" (without outer quotes)
 *
 * In the description of the HeadlessClient virtual unit, put HC
 */

if (!hasInterface && !isDedicated) exitWith {
	//run on headless clients only
};

_HC = owner HC; //"HC" denotes the name of the unit in-game
waitUntil {!isNil "HC"};

while {true} do {

	if (true) then {
		 if ((isPlayer _x)||(_x in units group _HC)) exitWith {};
    	 if (isNull _HC) exitWith{};
    	{ _x setGroupOwner _HC; //adding all units that aren't player or aren't already under HC to HC
    	diag_log format ["Successfully transferred a unit to HC"];
    	}
    	forEach allUnits;

	};

	sleep 10;
};

/*
 ["HCS_addToHC", "onEachFrame", {
    if ((isPlayer)||(_x in units group _HC)) exitWith {};
    if (isNull _HC) exitWith{};

    { _x setGroupOwner _HC; //adding all units that aren't player or aren't already under HC to HC
    }forEach allUnits;

}] call BIS_fnc_addStackedEventHandler;*/