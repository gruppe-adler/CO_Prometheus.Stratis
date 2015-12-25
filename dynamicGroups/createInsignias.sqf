_thisUnit = _this select 0;

fnc_setUnitInsignias =
{
                _unit = _this select 0;
                _patch = _this select 1;
                _index = 1;
                {
                        if (_x == "rank") exitwith {_index = _foreachindex;};
                }       foreach getarray (configfile >> "CfgVehicles" >> gettext ( configfile >> "CfgWeapons" >> uniform _unit >> "ItemInfo" >> "uniformClass") >> "hiddenSelections");
                _unit setObjectTextureGlobal [_index, _patch];
};
 
_group = group _thisUnit;   
        switch (_group) do
        {
                case "Command":
                {
                        [_thisUnit, "pic\insignia_command.paa"] call fnc_setUnitInsignias;
                };
                case "Alpha":
                {
                        [_thisUnit, "pic\insignia_alpha.paa"] call fnc_setUnitInsignias;
                };
                 case "Bravo":
                {
                        [_thisUnit, "pic\insignia_bravo.paa"] call fnc_setUnitInsignias;
                };
                case "Charlie":
                {
                        [_thisUnit, "pic\insignia_charlie.paa"] call fnc_setUnitInsignias;
                };
                 case "Delta":
                {
                        [_thisUnit, "pic\insignia_delta.paa"] call fnc_setUnitInsignias;
                };
                case "Heli":
                {
                        [_thisUnit, "pic\insignia_heli.paa"] call fnc_setUnitInsignias;
                };
                default {};
        };