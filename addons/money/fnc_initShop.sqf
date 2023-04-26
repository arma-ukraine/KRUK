#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Initialize shop with items to buy.
	
	Put this into the init field of the editor object that will be replaced with shop:
	
	[this, _target_inventory_object, [
		["_item_class", ["_item_type", _price, _amount_in_batch, _batches]], 
		["_item_class", ["_item_type", _price, _amount_in_batch, _batches]]
	]] call JAGER_money_fnc_setupShop;
	
	this - item shop is being initialized for.
	_target_inventory_object - editor object with inventory bought items will be placed into.
	_item_type - className of the item.
	_price - price. :)
	_amount_in_batch - how many items are bought every time.
	_batches - amount of batches available to buy before it runs out of stock.
	
*/

params [
	"_object",
	"_target_inventory",
	["_items", []]
];

// Server only.
if (!isServer) exitWith {};

// get reference object location and direction.
private _pos = getPosATL _object;
private _dir = getDir _object;

// Delete reference object.
deleteVehicle _object;

// Create ground inventory to hold items we'll buy.
_object = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
_object setDir _dir;
_object allowDamage false;

// Save object variables for later access.
_object setVariable [QGVAR(target_inventory), _target_inventory, true];
_object setVariable [QGVAR(shop), createHashMapFromArray _items, true];

// Protect the shop.
[_object, false] remoteExec ["allowDamage", 0, true];
[_object, false] remoteExec ["enableSimulation", 0, true];
[_object] remoteExec ["removeAllActions", 0, true];

// Add actions to clients.
{
	private _category = _x#1#0;
	private _classname = _x#0;
	private _display_name = "?";

	switch (_category) do
	{
		case "Weapon": {
			_object addWeaponCargoGlobal [_classname, 1];
			_display_name = getText (configFile >> "CfgWeapons" >> _classname >> "DisplayName")
		};
		case "Magazine": {
			_object addMagazineCargoGlobal [_classname, 1];
			_display_name = getText (configFile >> "CfgMagazines" >> _classname >> "DisplayName")
		};
		case "Backpack": {
			_object addBackpackCargoGlobal [_classname, 1];
			_display_name = getText (configFile >> "CfgWeapons" >> _classname >> "DisplayName")
		};
		default {
			_object addItemCargoGlobal [_classname, 1];
			_display_name = getText (configFile >> "CfgWeapons" >> _classname >> "displayName")
		};
	};

	[_object, [format ["Придбати %1 (%3 шт, %2 грн)", _display_name, _x#1#1, _x#1#3], FUNC(buyItem), _x#0, 1, false, true, "", "_this distance _target < 3"]] remoteExec ["addAction", 0, true]
} forEach _items;