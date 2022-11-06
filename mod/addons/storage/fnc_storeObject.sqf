#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_target", "_caller", "_actionId", "_classname"];

private _tag = _target getVariable QGVAR(tag);
private _ops_location = _target getVariable QGVAR(ops_location);

// find item with inventory in the nearest vicinity of the ops location.
private _objects = nearestObjects [_ops_location, ["ReammoBox_F"], 5];
if ((count _objects) == 0) exitWith {
	systemChat "Нема чого віддати на зберігання.";
};
private _obj = nearestObjects [_ops_location, ["ReammoBox_F"], 5] # 0;

// Save inventory as a data structure.
_inventory = _obj call FUNC(getInventory);

// Pass data structure to the server for it to be saved.
private _location = format ["%1/storage_%2", getPlayerUID player, _tag];
[_location, [typeOf _obj, _inventory]] call JAGER_main_fnc_saveState;

// Delete in-game object.
deleteVehicle _obj;