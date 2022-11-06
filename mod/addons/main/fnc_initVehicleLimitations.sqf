#include "script_component.hpp"
TRACE_1("trace", nil);

// Client only.
if (!hasInterface) exitWith {
	WARNING("initVehicleLimitations script should only be called on clients.");
};

// Initialize driving limitations.
player addEventHandler ["GetInMan", {
	params ["_unit"];
	_unit call FUNC(handleVehicleSeatEntered);
}];
player addEventHandler ["SeatSwitchedMan", {
	params ["_unit1", "_unit2"];
	_unit1 call FUNC(handleVehicleSeatEntered);
	_unit2 call FUNC(handleVehicleSeatEntered);
}];