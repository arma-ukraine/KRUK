#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_object", "_args"];

_args params ["_pos"];

if ((count _object) == 0) exitWith {
	systemChat "Нічого діставати зі зберігання.";
};

_classname = _object#0;
_inventory = _object#1;

_object = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
[_object, _inventory] call FUNC(loadVehicleInventory);