#define CATEGORYNAME        "Gruppe Adler"

[CATEGORYNAME,"Loadouts festlegen",{_this call prometheus_zeus_fnc_setLoadoutModule}] call ares_fnc_registerCustomModule;
[CATEGORYNAME,"Client FPS ein/aus",{[] call prometheus_zeus_fnc_diagClientModule}] call ares_fnc_registerCustomModule;
