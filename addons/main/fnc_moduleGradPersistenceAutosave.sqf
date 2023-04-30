#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	EDEN Module: autosave every 30 minutes with Grad Persistence.
*/
if (!isServer) exitWith {};

[] spawn {
	while { true } do {
		[true, 15] call grad_persistence_fnc_saveMission;
		sleep 1800;
	};
};