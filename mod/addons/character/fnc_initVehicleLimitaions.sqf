#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	set up vehicle limitations for players.
	
	call FUNC(...);
*/

// Client only.
if (!hasInterface) exitWith {};
waitUntil {
	!isNull player
};

// Execute when unit enters seat.
handleVehicleSeatEntered = {
	private _unit = _this;

	// if entity is a player.
	if (isPlayer _unit) then {
		private _role = (assignedVehicleRole _unit) select 0;
		private _vehicle = objectParent _unit;
		private _vehicle_category = _vehicle call BIS_fnc_objectType select 1;
		private _vehicle_type = typeOf _vehicle;

		// Make sure player has necessary role.
		if ((_role == "cargo") or (_vehicle_category in (GVAR(character_state) get _role)) or (_vehicle_type in (GVAR(character_state) get _role))) then {
			TRACE_4("allowed vehicle entry", _vehicle_type, _vehicle_category, _unit, _role);
		} else {
			// If player doesn't have necessary role - just kick him out.
			_unit moveOut _vehicle;
			"Ви не вмієте того робити." remoteExec ["systemChat", _unit];
			TRACE_4("denied vehicle entry", _vehicle_type, _vehicle_category, _unit, _role);
		};
	};
};

// Initialize driving limitations handlers.
player addEventHandler ["GetInMan", {
	params ["_unit"];
	_unit call handleVehicleSeatEntered;
}];
player addEventHandler ["SeatSwitchedMan", {
	params ["_unit1", "_unit2"];
	_unit1 call handleVehicleSeatEntered;
	_unit2 call handleVehicleSeatEntered;
}];