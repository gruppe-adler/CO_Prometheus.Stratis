#define PREFIX prometheus
#define COMPONENT init
#include "\x\cba\addons\main\script_macros_mission.hpp"

//HEADLESS =====================================================================
_headless = ("HC_enabled" call BIS_fnc_getParamValue) == 1;
if (_headless) then {[] call prometheus_fnc_initHeadless};



if (!isServer) exitWith {};
//TIME =========================================================================
_timeOfDay = "TimeOfDay" call BIS_fnc_getParamValue;
setDate [2015, 2, 2, _timeOfDay, 1];

_timeMultiplier = "Zeitbeschleunigung" call BIS_fnc_getParamValue;
setTimeMultiplier _timeMultiplier;

//WEATHER ======================================================================
_overcast = ("WeatherSetting" call BIS_fnc_getParamValue) * 0.01;

_mid = 0.03;
if (_overcast >= 75) then {
    _mid = _mid + 0.08;
};
if (_timeOfDay <= 8) then {
    _mid = _mid + 0.12;
};
_fog = random [0,_mid,0.4];


[_overcast] call bis_fnc_setOvercast;
0 setFog _fog;


//LOG ==========================================================================
INFO_1("Headless client: %1",_headless);
INFO_1("Set time of day to %1.",_timeOfDay);
INFO_1("Set time multiplier to %1.",_timeMultiplier);
INFO_1("Set overcast to %1.",_overcast);
INFO_1("Set fog to %1.",_fog);
