#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	EDEN Module: autosave every 30 minutes with Grad Persistence.
*/

[true, 15] remoteExec ["grad_persistence_fnc_saveMission", 2];