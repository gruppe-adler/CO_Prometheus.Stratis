#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

enableSentences false;
enableRadio false;

if (!isMultiplayer) then { // Editor
	{_x disableAI "MOVE"} forEach allUnits;
};

//dont move to postInit function so that JIP can receive public variables first


if (isServer) then {
	_woodland = ["woodland",true] call prometheus_fnc_getIslandCfgEntry;
	["BLU_F", missionNamespace getVariable ["prometheus_factionLoadout"+"BLU_F",if (_woodland) then {"UsMPT"} else {"UsOCP"}],true] call GRAD_Loadout_fnc_FactionSetLoadout;
	["OPF_F", missionNamespace getVariable ["prometheus_factionLoadout"+"OPF_F",if (_woodland) then {"RuFlora"} else {"RuMedit"}],true] call GRAD_Loadout_fnc_FactionSetLoadout;
	["IND_F", missionNamespace getVariable ["prometheus_factionLoadout"+"IND_F",if (_woodland) then {"BwFleck"} else {"BwTrop"}],true] call GRAD_Loadout_fnc_FactionSetLoadout;
	publicVariable "grad_loadout_factionPathMap";
} else {
	_condition = {!((["BLU_F"] call grad_loadout_fnc_factionGetLoadout) isEqualTo "BLU_F")};
	_onTimeout = {ERROR("grad_loadout_factionPathMap has not yet been received from server")};
	_fnc_applyLoadouts = {
		{
			if (local _x) then {[_x] call GRAD_Loadout_fnc_doLoadoutForUnit};
		} forEach allUnits;
	};

	[_condition,_fnc_applyLoadouts,[],60,_onTimeout] call CBA_fnc_waitUntilAndExecute
};

[] execVM "adjustInitialSpawnPosition.sqf";
