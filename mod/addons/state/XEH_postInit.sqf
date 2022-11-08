#include "script_component.hpp"
TRACE_1("trace", nil);

#ifdef DEBUG_MODE_FULL
["pythia.enable_reloader", [true]] call py3_fnc_callExtension;
systemChat "DEBUG MODE - FULL: Pythia reloader enabled";
#endif