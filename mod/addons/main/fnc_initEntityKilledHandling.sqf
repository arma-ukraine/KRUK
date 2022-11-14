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

	// Remove all weapons half the time.
	if (random 1 < 0.5) then {
		removeAllWeapons _unit;
	};

	// Remove vests half the time.
	if (random 1 < 0.5) then {
		removeVest _unit;
	};

	// Remove backpacks half the time.
	if (random 1 < 0.5) then {
		removeBackpack _unit;
	};

	// Remove all magazines always.
	if (!(isPlayer _unit)) then {
		{
			_unit removeMagazineGlobal _x;
		} forEach magazines _unit;
	};
}];