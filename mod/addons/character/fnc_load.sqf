#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	load player data.
	
	_player_uid call FUNC(...);
*/

params ["_uid"];

// Client only. We load characters locally to make it easier
// to manipulate client properties.

// get our UID.
TRACE_1("load character", _uid);
private _local_uid = getPlayerUID player;

// if we try to load someone else - redirect remote execution
// of this function to someone else so that callback is executed/
// on the right machine.
if (_uid != _local_uid) exitWith {
	TRACE_1("non-local character load, redirecting to local", _uid);
	[_uid] remoteExec [QFUNC(load), _uid call BIS_fnc_getUnitByUID];
};

// We are on the right machine.

// Compose location we'll attempt to load the data from.
private _location = format ["%1/character", _uid];

// Send request to server to load our data and call us back with
// the said data.
TRACE_1("local character load request", _location);
[_location, QFUNC(loadOnClient), call FUNC(default)] call JAGER_state_fnc_load;