#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Remove some equipment from dead enemies and players.
	
	call FUNC(...);
*/

// Server only.
if (!isServer) exitWith {};

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	if (random 1 < 0.5) then {
		removeAllWeapons _unit;
	};

	if (random 1 < 0.5) then {
		removeAllItems _unit;
	};

	if (random 1 < 0.5) then {
		removeAllAssignedItems _unit;
	};

	if (random 1 < 0.5) then {
		removeVest _unit;
	};

	if (random 1 < 0.5) then {
		removeBackpack _unit;
	};

	if (random 1 < 0.5) then {
		removeHeadgear _unit;
	};

	// Remove all magazines.
	if (!(isPlayer _unit)) then {
		{
			_unit removeMagazineGlobal _x;
		} forEach magazines _unit;
	};
}];