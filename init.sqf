#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

enableSentences false;
enableRadio false;

call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
// [] execVM "CSSA3\CSSA3_init.sqf";

if (!isMultiplayer) then { // Editor
	{_x disableAI "MOVE"} forEach allUnits;
};

//dont move to postInit function so that JIP can receive public variables first
_woodland = ["woodland",true] call prometheus_fnc_getIslandCfgEntry;
["BLU_F", missionNamespace getVariable ["prometheus_factionLoadout"+"BLU_F",if (_woodland) then {"UsMPT"} else {"UsOCP"}]] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", missionNamespace getVariable ["prometheus_factionLoadout"+"OPF_F",if (_woodland) then {"RuFlora"} else {"RuMedit"}]] call GRAD_Loadout_fnc_FactionSetLoadout;
["IND_F", missionNamespace getVariable ["prometheus_factionLoadout"+"IND_F",if (_woodland) then {"BwFleck"} else {"BwTrop"}]] call GRAD_Loadout_fnc_FactionSetLoadout;

clearInventory = compile preprocessFile "helpers\clearInventory.sqf";
[] execVM "setup\adjustInitialSpawnPosition.sqf";
