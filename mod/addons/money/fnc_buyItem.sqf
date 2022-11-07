#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_target", "_caller", "_actionId", "_classname"];

private _target_inventory = _target getVariable QGVAR(target_inventory);
private _shop = _target getVariable QGVAR(shop);
private _item = _shop get _classname;

private _category = _item#0;
private _price = _item#1;
private _stock_batches = _item#2;
private _amount_in_batch = _item#3;
private _display_name = "";

// Check if item is in stock, exit if none available.
if (_stock_batches < 1) exitWith {
	systemChat "Цей товар закінчився, приходьте пізніше.";
};

// Attempt to take money, exit on failure.
if (!([_caller, -_price] call FUNC(addMoney))) exitWith {};

// Update item stock.
_stock_batches = _stock_batches - 1;
_item set [2, _stock_batches];
_shop set [_classname, _item];
_target setVariable [QGVAR(shop), _shop, true];

// Add item to the target inventory.
switch (_category) do
{
	case "Weapon": {
		_target_inventory addWeaponCargoGlobal [_classname, _amount_in_batch];
		_display_name = getText (configFile >> "CfgWeapons" >> _classname >> "DisplayName");
	};
	case "Magazine": {
		_target_inventory addMagazineCargoGlobal [_classname, _amount_in_batch];
		_display_name = getText (configFile >> "CfgMagazines" >> _classname >> "DisplayName");
	};
	case "Backpack": {
		_target_inventory addBackpackCargoGlobal [_classname, _amount_in_batch];
		_display_name = getText (configFile >> "CfgWeapons" >> _classname >> "DisplayName");
	};
	default {
		_target_inventory addItemCargoGlobal [_classname, _amount_in_batch];
		_display_name = getText (configFile >> "CfgWeapons" >> _classname >> "DisplayName");
	};
};

// Notify player about success.
systemChat format ["Придбано: %1 x %2 за %3 грн. Товар в ящику поряд.", _amount_in_batch, _display_name, _price];