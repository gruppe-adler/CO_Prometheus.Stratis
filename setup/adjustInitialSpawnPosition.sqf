#include "..\missionMacros.h"
// spawn outside of map on flat terrain if possible
_alternativeSpawnsOutsideMap = [[-2500,-500],[-500,-2500]];

_playerPositionsForCurrentWorld = ISLAND_TARGET_POSITIONS select (ISLANDS find worldName);
if !(_playerPositionsForCurrentWorld select 2) then {
	_playerPositionsForCurrentWorld = _alternativeSpawnsOutsideMap;
};

_targetPosition= _playerPositionsForCurrentWorld select 1;
if (side player == blufor) then {
	_targetPosition= _playerPositionsForCurrentWorld select 0;
};


if (isServer) exitWith {
	_targetPosition= _playerPositionsForCurrentWorld select 1;
	_tmpPos_arsenal_1 = [_targetPosition,[0,10], random 360,0,[5,80]] call SHK_pos;
	arsenal_1 setPos _tmpPos_arsenal_1; 

	_targetPosition= _playerPositionsForCurrentWorld select 0;
	_tmpPos_arsenal_2 = [_targetPosition,[0,10], random 360,0,[5,80]] call SHK_pos;
	arsenal_2 setPos _tmpPos_arsenal_2; 

	// create automatic loadout boxes
	[_tmpPos_arsenal_2] execVM "loadouts\createAutomaticLoadoutsBoxes.sqf";
};


waitUntil {player == player};



// _msg = format["moving player to %1 ...", _targetPosition];
// debugLog(_msg);


_tmpPos = [_targetPosition,[0,10], random 360,0,[1,50]] call SHK_pos;

player setPos [_tmpPos select 0, _tmpPos select 1, 0]; // force to ZERO height

player switchmove "AmovPercMstpSnonWnonDnon";