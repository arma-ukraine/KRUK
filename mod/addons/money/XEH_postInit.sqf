#include "script_component.hpp"
TRACE_1("trace", nil);

// Server.
if (isServer) then {};

// Client.
if (hasInterface) then {
	waitUntil {
		!isNull player
	};
};