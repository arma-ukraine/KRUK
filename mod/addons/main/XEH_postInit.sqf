#include "script_component.hpp"
TRACE_1("trace", nil);

GVARMAIN(tfarLoaded) = isClass (configfile >> "CfgPatches" >> "tfar_core");

// Everything.
call FUNC(initDynamicSimulation);

// Server.
if (isServer) then {
	call FUNC(initEntityKilledHandling);
};

// Client.
if (hasInterface) then {
	waitUntil {
		!isNull player
	};

	call FUNC(initFuelConsumption);
	call FUNC(initColorCorrection);
	call FUNC(initUnarmed);
};