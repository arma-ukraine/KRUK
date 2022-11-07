#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_vehicle"];

private _inventory = [];

// items
private _itemCargo = itemCargo _vehicle;
_itemCargo = RETDEF(_itemCargo, []);
if (GVARMAIN(tfarLoaded)) then {
	_itemCargo = [_itemCargo] call FUNC(deInstanceTFARRadios);
};
_itemCargo = [_itemCargo] call FUNC(generateCountArray);
_inventory pushBack _itemCargo;

// weapons
private _weaponCargo = weaponsItemsCargo _vehicle;
_weaponCargo = RETDEF(_weaponCargo, []);
_inventory pushBack _weaponCargo;

// magazines
private _magazinesAmmoCargo = magazinesAmmoCargo _vehicle;
_magazinesAmmoCargo = RETDEF(_magazinesAmmoCargo, []);
_inventory pushBack _magazinesAmmoCargo;

// backpacks
private _backpackCargo = [];
private _backpackItems = everyBackpack _vehicle;
_backpackItems = RETDEF(_backpackItems, []);
{
	_backpackData = [typeOf _x];

	if (GVARMAIN(tfarLoaded)) then {
		_backpackItemCargo = [_backpackItemCargo] call FUNC(deInstanceTFARRadios);
	};
	_backpackItemCargo = [_backpackItemCargo] call FUNC(generateCountArray);

	_backpackBackpackCargo = backpackCargo _x;
	_backpackBackpackCargo = [_backpackBackpackCargo] call FUNC(generateCountArray);

	_backpackData pushBack _backpackItemCargo;
	_backpackData pushBack (weaponsItems _x);
	_backpackData pushBack (getMagazineCargo _x);
	_backpackData pushBack _backpackBackpackCargo;

	_backpackCargo pushBack _backpackData;
} forEach _backpackItems;
_inventory pushBack _backpackCargo;

// return results
_inventory