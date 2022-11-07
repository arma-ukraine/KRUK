#include "script_component.hpp"
TRACE_1("trace", nil);

#ifdef DEBUG_MODE_FULL
["pythia.enable_reloader", [true]] call py3_fnc_callExtension;
systemChat "DEBUG MODE - FULL: Pythia reloader enabled";
#endif

GVARMAIN(tfarLoaded) = isClass (configfile >> "CfgPatches" >> "tfar_core");

if (isServer) then {
	call FUNC(handleDisconnect);
};

if (hasInterface) then {
	waitUntil {
		!isNull player
	};

	call FUNC(initVehicleLimitations);
	call FUNC(initFuelConsumption);
	(getPlayerUID player) call FUNC(loadCharacter);
	call FUNC(initColorCorrection);
	call FUNC(initRespawn);
};