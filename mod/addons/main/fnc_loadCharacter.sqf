#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_uid"];

private _local_uid = getPlayerUID player;

if (_uid == _local_uid) exitWith {
	private _location = format ["%1/character", _uid];
	[_location, QFUNC(initCharacter), call FUNC(defaultCharacter)] call JAGER_main_fnc_loadState;
};

if (_uid != _local_uid) exitWith {
	[_uid] remoteExec [QFUNC(loadCharacter), _uid call BIS_fnc_getUnitByUID];
};