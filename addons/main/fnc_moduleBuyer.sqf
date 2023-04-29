#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Creates buyer from synced boxes with inventories.
	
*/

// Client only.
if (!hasInterface) exitWith {};
waitUntil {
	!isNull player
};
params ["_logic", "_units", "_is_activated"];
scopeName "main";
private _buyPriceMultiplier = _logic getVariable "BuyPriceMultiplier";

private _buyableClasses = [];
{
	private _items = getItemCargo _x;
	{
		private _value = getNumber (configFile >> "CfgWeapons" >> _x >> "JAGER_main_value");
		if (_value == 0 or _x isKindOf ["JAGER_main_Uah", configFile >> "CfgWeapons"]) then {
			continue
		};
		_buyableClasses pushBackUnique _x;
	} forEach _items#0;
	clearItemCargoGlobal _x;
} forEach (synchronizedObjects _logic);

{
	_x addAction ["Продати товар", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_arguments params ["_buyableClasses", "_buyPriceMultiplier"];

		private _items = getItemCargo _target;
		private _total = 0;
		for "_i" from 0 to (count (_items#0)) - 1 do {
			private _class = _items#0#_i;
			private _amount = _items#1#_i;

			private _value = getNumber (configFile >> "CfgWeapons" >> _class >> "JAGER_main_value");
			// Exclude money and items without value.
			if (_value == 0 or _class isKindOf ["JAGER_main_Uah", configFile >> "CfgWeapons"]) then {
				systemChat format["%1 тут не купують. Приберіть і спробуйте знову.", getText (configFile >> "CfgWeapons" >> _class >> "displayName")];
				breakOut "main";
			};

			// Add to total.
			_total = _total + floor (_value * _buyPriceMultiplier) * _amount;
		};
		clearItemCargoGlobal _target;
		{
			_target addItemCargoGlobal [_x, 1];
		} forEach (_total call JAGER_main_fnc_amountToBanknotes);
		systemChat format ["Продано за %1 грн.", _total];
	}, [_buyableClasses, _buyPriceMultiplier], 1, true, true, "", "true", 2, false, "", ""]
} forEach synchronizedObjects _logic;