/*
	Saves state to a location.
*/

#include "script_component.hpp"

params ["_location", "_state"];

// Server only. Redirect the call if necessary.
if (!isServer) exitWith {
	[_location, _state] remoteExec [QFUNC(save), 2];
};

// Save data.
["src.state.save", [_location, _state]] call py3_fnc_callExtension;