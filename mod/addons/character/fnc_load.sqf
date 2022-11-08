#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_uid"];

private _local_uid = getPlayerUID player;

if (_uid == _local_uid) exitWith {
	private _location = format ["%1/character", _uid];
	[_location, QFUNC(loadOnClient), call FUNC(default)] call JAGER_state_fnc_load;
};

if (_uid != _local_uid) exitWith {
	[_uid] remoteExec [QFUNC(load), _uid call BIS_fnc_getUnitByUID];
};