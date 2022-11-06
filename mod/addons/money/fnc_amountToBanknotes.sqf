#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_amount"];
private _banknotes_config = "inheritsFrom _x == (configFile >> 'CfgWeapons' >> 'Uah')" configClasses (configFile >> "CfgWeapons");
private _nominals = [_banknotes_config, {
	getNumber (_x >> "value")
}] call CBA_fnc_filter;
private _sum = 0;
private _banknotes = [];

_nominals sort false;
{
	if (_sum + _x > _amount) then {
		continue;
	};
	while { _sum + _x <= _amount } do {
		_sum = _sum + _x;
		_banknotes pushBack (format ["Uah_%1", _x]);
	};
} forEach (_nominals);

_banknotes;