#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Convert amount to a set of banknote items.
	
	_banknotes = [_amount] call FUNC(...);
	
	_amount - number to convert to the array of banknote items
	
	_banknotes - array of banknote items
*/

params ["_amount"];
private _banknotes_config = "inheritsFrom _x == (configFile >> 'CfgWeapons' >> 'JAGER_money_Uah')" configClasses (configFile >> "CfgWeapons");
private _nominals = [_banknotes_config, {
	getNumber (_x >> "value")
}] call CBA_fnc_filter;
private _sum = 0;
private _banknotes = [];

// sort nominals.
_nominals sort false;

// Go from highest to lowest nominals adding them one by one until we go over
// the necessary sum, then try to add smaller amounts until we end up
// with the exact one we need.
{
	if (_sum + _x > _amount) then {
		continue;
	};
	while { _sum + _x <= _amount } do {
		_sum = _sum + _x;
		_banknotes pushBack (format ["JAGER_money_Uah_%1", _x]);
	};
} forEach (_nominals);

_banknotes;