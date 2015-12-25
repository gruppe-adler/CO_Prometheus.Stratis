_unit = _this select 0;

if (isServer) then
{
   private ["_group", "_leader", "_data"];
   _group  = group _unit;
   _leader = leader _group;
   _data   = ["GRAD_charlie", "Charlie", false]; // [<Insignia>, <Group Name>, <Private>]
 
   ["RegisterGroup", [_group, _leader, _data]] call BIS_fnc_dynamicGroups;
};