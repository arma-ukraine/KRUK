#include "script_component.hpp"
TRACE_1("trace", nil);

// Category, Price, Batches in Stock, Amount in Batch.

// [this, storage_box, [
	// ["hgun_Pistol_01_F", ["Weapon", 400, 1, 1]], 
	// ["10Rnd_9x21_Mag", ["Magazine", 100, 1, 2]], 
	// ["greenmag_ammo_9x21_basic_30Rnd", ["Item", 150, 1, 1]]
// ]] call JAGER_money_fnc_setupShop;

params [
	"_object",
	"_target_inventory",
	["_items", []]
];

private _pos = getPosATL _object;
private _dir = getDir _object;
deleteVehicle _object;

private _object = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
_object setDir _dir;

removeAllActions _object;
_object allowDamage false;

if (isServer) then {
	_object setVariable [QGVAR(target_inventory), _target_inventory, true];
	_object setVariable [QGVAR(shop), createHashMapFromArray _items, true];
};

{
	private _category = _x#1#0;
	private _classname = _x#0;

	private _display_name = "";

	switch (_category) do
	{
		case "Weapon": {
			_object addWeaponCargo [_classname, 1];
			_display_name = getText (configFile >> "CfgWeapons" >> _classname >> "DisplayName")
		};
		case "Magazine": {
			_object addMagazineCargo [_classname, 1];
			_display_name = getText (configFile >> "CfgMagazines" >> _classname >> "DisplayName")
		};
		case "Backpack": {
			_object addBackpackCargo [_classname, 1];
			_display_name = getText (configFile >> "CfgWeapons" >> _classname >> "DisplayName")
		};
		default {
			_object addItemCargo [_classname, 1];
			_display_name = getText (configFile >> "CfgWeapons" >> _classname >> "displayName")
		};
	};

	_object addAction [format ["Придбати %1 (%3 шт, %2 грн)", _display_name, _x#1#1, _x#1#3], FUNC(buyItem), _x#0, 1, false, true, "", "_this distance _target < 3"];
} forEach _items;

_object enableSimulation false;