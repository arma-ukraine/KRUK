#include "script_component.hpp"
TRACE_1("trace", nil);

// Server only.
if (!isServer) exitWith {
	WARNING("handleDisconnect should only be called on the server.");
};

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	[_uid] call FUNC(save);
	false;
}];