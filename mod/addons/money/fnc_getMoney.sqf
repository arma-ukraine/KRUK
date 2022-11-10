#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Calcualte how much money does a unit have.
	
	_amount = ["_unit"] call FUNC(...);
	
	_unit - unit to calcualte amount of money for.
	
	_amount - result of the calculation.
*/

params ["_unit"];

private _money = 0;
{
	if (_x isKindOf ["JAGER_money_Uah", configFile >> "CfgWeapons"]) then {
		_money = _money + getNumber (configFile >> "CfgWeapons" >> _x >> "value");
	}
} forEach items _unit;

_money;