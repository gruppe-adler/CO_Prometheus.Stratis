#define CATEGORYNAME        "GRUPPE ADLER"

[CATEGORYNAME,"Startposition",{_this call prometheus_zeus_fnc_setStartPositionModule}] call ares_fnc_registerCustomModule;
[CATEGORYNAME,"Loadouts",{_this call prometheus_zeus_fnc_setLoadoutModule}] call ares_fnc_registerCustomModule;
[CATEGORYNAME,"Client FPS ein/aus",{[] call prometheus_zeus_fnc_diagClientModule}] call ares_fnc_registerCustomModule;
[CATEGORYNAME,"Ownership übertragen",{_this call prometheus_zeus_fnc_transferOwnerModule}] call ares_fnc_registerCustomModule;
[CATEGORYNAME,"Mission beendet Effekt",{_this call prometheus_zeus_fnc_endMissionEffectModule}] call ares_fnc_registerCustomModule;

//deaktiviert - funktioniert anscheinend nicht zuverlässig
/*[CATEGORYNAME,"Bündnisse",{_this call prometheus_zeus_fnc_setAllegianceModule}] call ares_fnc_registerCustomModule;*/
