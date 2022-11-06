#include "script_component.hpp"
TRACE_1("trace", nil);

// Client only.
if (!hasInterface) exitWith {};

private _unit = _this;

if (isPlayer _unit) then {
	private _role = (assignedVehicleRole _unit) select 0;
	private _vehicle = objectParent _unit;
	private _vehicle_category = _vehicle call BIS_fnc_objectType select 1;
	private _vehicle_type = typeOf _vehicle;

	if ((_role == "cargo") or (_vehicle_category in (GVAR(character_state) get _role)) or (_vehicle_type in (GVAR(character_state) get _role))) then {
		diag_log format ["[DIR][CHARS] Allowed entry into '%1' of type '%2' for player '%3' for role '%4'", typeOf _vehicle, _vehicle_category, _unit, _role];
	} else {
		_unit moveOut _vehicle;
		"Ви не вмієте того робити." remoteExec ["hint", _unit];
		diag_log format ["[DIR][CHARS] Denied entry into '%1' of type '%2' for player '%3' for role '%4'", typeOf _vehicle, _vehicle_category, _unit, _role];
	};
};