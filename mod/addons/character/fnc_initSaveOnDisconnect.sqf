#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Add handler to save character on player disconnect.
	
	call FUNC(...);
*/

// Server only.
if (!isServer) exitWith {};

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	[_uid] call FUNC(save);
	false;
}];