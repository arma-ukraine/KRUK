#include "script_component.hpp"
TRACE_1("trace", nil);

// Server only.
if (!isServer) exitWith {};

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	if (random 1 < 0.95) then {
		removeAllWeapons _unit;
	};

	if (random 1 < 0.95) then {
		removeAllItems _unit;
	};

	if (random 1 < 0.95) then {
		removeAllAssignedItems _unit;
	};

	if (random 1 < 0.95) then {
		removeVest _unit;
	};

	if (random 1 < 0.95) then {
		removeBackpack _unit;
	};

	if (random 1 < 0.95) then {
		removeHeadgear _unit;
	};

	// Remove all magazines.
	{
		_unit removeMagazineGlobal _x;
	} forEach magazines _unit;
}];