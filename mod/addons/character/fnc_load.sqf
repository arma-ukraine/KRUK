#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_uid"];

TRACE_1("load character", _uid);
private _local_uid = getPlayerUID player;

if (_uid != _local_uid) exitWith {
	TRACE_1("non-local character load, redirecting to local", _uid);
	[_uid] remoteExec [QFUNC(load), _uid call BIS_fnc_getUnitByUID];
};

private _location = format ["%1/character", _uid];

TRACE_1("local character load request", _location);
[_location, QFUNC(loadOnClient), call FUNC(default)] call JAGER_state_fnc_load;