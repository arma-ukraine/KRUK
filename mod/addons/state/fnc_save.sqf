#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	save state.
	
	[_location, _state] call FUNC(...);
	
	_location - essentially, file path data will be loaded from
	_state - data to save
*/

params ["_location", "_state"];

// Server only. Redirect the call if necessary.
if (!isServer) exitWith {
	[_location, _state] remoteExec [QFUNC(save), 2];
};

TRACE_2("saving state", _location, _state);

// Save data.
["src.state.save", [_location, _state]] call py3_fnc_callExtension;