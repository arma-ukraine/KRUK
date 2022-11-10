#include "script_component.hpp"
TRACE_1("trace", nil);

// Client only.
if (!hasInterface) exitWith {};

[getPlayerUID player] spawn {
	params ["_uid"];
	while { true } do {
		[_uid] call FUNC(save);
		sleep 600; // Wait for 10 minutes.
	};
};