#include "script_component.hpp"
TRACE_1("trace", nil);

if (isServer) then {
	call FUNC(initSaveOnDisconnect);
};

if (hasInterface) then {
	waitUntil {
		!isNull player
	};

	(getPlayerUID player) call FUNC(load);
	call FUNC(initVehicleLimitaions);
	call FUNC(initRespawnHandling);
};