#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_unit"];

private _money = 0;
{
	if (_x isKindOf ["Uah", configFile >> "CfgWeapons"]) then {
		_money = _money + getNumber (configFile >> "CfgWeapons" >> _x >> "value");
	}
} forEach items _unit;

_money;