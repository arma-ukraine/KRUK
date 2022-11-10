#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Zeus module: AoE hint. Doesn't work...
*/

params ["_logic"];

private _position = getPos _logic;

{
	if (alive _x && isPlayer _x) then {
		"test" remoteExec ["hint", _x]
	};
} forEach nearestObjects [(getPos _logic), "Man", 100, true];

deleteVehicle _logic;