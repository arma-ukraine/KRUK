/*
	Loads state from the location.
*/

#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_location", "_callback", "_default", "_args"];

_args = RETDEF(_args, []);

// Server only, redirect the call if necessary.
if (!isServer) exitWith {
	[_location, _callback, _default, _args] remoteExec [QFUNC(loadState), 2];
};

// We are on server. load state.
private _state = ["src.state.load", [_location]] call py3_fnc_callExtension;

// if state is not available.
if (isNil "_state") then {
	// set state to default.
	_state = _default;

	// Save default state.
	[_location, _state] call FUNC(save);
};

// if call was initiated by remote entity, run callback there.
if (isRemoteExecuted) exitWith {
	[_state, _args] remoteExec [_callback, remoteExecutedOwner];
};

// if call was initiated by the server itself, run callback on server.
if (!isRemoteExecuted) exitWith {
	[_state, _args] call (call compile _callback);
};