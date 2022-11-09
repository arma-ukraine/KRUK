/*
	Loads state from the location.
*/

#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_location", "_callback", "_default", "_args"];
TRACE_4("received data load request", _location, _callback, _default, _args);

_args = RETDEF(_args, []);

// Server only, redirect the call if necessary.
if (!isServer) exitWith {
	TRACE_1("function executed on client, redirecting request to server", nil);
	[_location, _callback, _default, _args] remoteExec [QFUNC(load), 2];
};

// We are on server. load state.
private _state = ["src.state.load", [_location]] call py3_fnc_callExtension;
TRACE_1("loaded data", _state);

// if state is not available.
if (isNil "_state") then {
	TRACE_1("state is nil, loading default", _default);
	// set state to default.
	_state = _default;

	// Save default state.
	[_location, _state] call FUNC(save);
};

// if call was initiated by remote entity, run callback there.
if (isRemoteExecuted) exitWith {
	TRACE_1("return callback to the remote entity", _default);
	[_state, _args] remoteExec [_callback, remoteExecutedOwner];
};

// if call was initiated by the server itself, run callback on server.
if (!isRemoteExecuted) exitWith {
	TRACE_1("run callback locally", _default);
	[_state, _args] call (call compile _callback);
};