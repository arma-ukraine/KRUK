#include "script_component.hpp"
TRACE_1("trace", nil);

// Client only.
if (!hasInterface) exitWith {
	WARNING("handleDisconnect should only be called on the client.");
};

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];

	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;
}];