_unit = _this select 0;
_groupThis = group _unit;

if (isServer) then
{
   private ["_group", "_leader", "_data"];
   _group  = group _unit;
   _leader = leader _group;
   _data   = [nil, "Heli", false]; // [<Insignia>, <Group Name>, <Private>]
 
   ["RegisterGroup", [_group, _leader, _data]] call BIS_fnc_dynamicGroups;
};
