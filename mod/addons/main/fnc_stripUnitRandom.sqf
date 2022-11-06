#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_unit"];

// Remove ammo.
{
	if (random 1 < 0.90) then {
		_unit removeMagazine _x;
	};
} forEach magazines _unit;

// Remove vest.
removeVest _unit;

// Remove backpack.
if (random 1 < 0.80) then {
	removeBackpack _unit;
};

// Remove goggles and armbands.
removeGoggles _unit;