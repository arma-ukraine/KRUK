#include "script_component.hpp"
TRACE_1("trace", nil);

// Server.
if (isServer) then {
	addMissionEventHandler ["EntityKilled", FUNC(handleEntityKilled)];
};

// Client.
if (hasInterface) then {};