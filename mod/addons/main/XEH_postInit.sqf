#include "script_component.hpp"
TRACE_1("trace", nil);

GVARMAIN(tfarLoaded) = isClass (configfile >> "CfgPatches" >> "tfar_core");

if (isServer) then {
	call FUNC(initEntityKilledHandling);
};

if (hasInterface) then {
	waitUntil {
		!isNull player
	};

	call FUNC(initFuelConsumption);
	call FUNC(initColorCorrection);
	call FUNC(initUnarmed);
};