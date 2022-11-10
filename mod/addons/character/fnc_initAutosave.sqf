#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Initiates autosave feature.
	
	call FUNC(...);
*/

// Client only.
if (!hasInterface) exitWith {};
waitUntil {
	!isNull player
};

[getPlayerUID player] spawn {
	params ["_uid"];
	while { true } do {
		[_uid] call FUNC(save);
		sleep 600; // Wait for 10 minutes.
	};
};