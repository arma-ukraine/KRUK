#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_target", "_delta"];

private _result = true;

switch (true) do {
	case (_delta > 0): {
		// Add money.

		private _banknotes = _delta call FUNC(amountToBanknotes);
		{
			if (alive _target) then {
				_target addItem _x;
			} else {
				_uniform = uniformContainer _target;
				_uniform addItemCargoGlobal [_x, 1];
			};
		} forEach _banknotes;
	};
	case (_delta < 0): {
		// Remove money.

		// Only works on alive players.
		if (!(alive _target) or !(isPlayer _target)) exitWith {};

		// It's easier to work with positive value instead of negative one.
		_delta = -_delta;

		private _player_banknotes = [items _target, [], {
			getNumber (configFile >> "CfgWeapons" >> _x >> "value")
		}, "ASCEND", {
			_x isKindOf ["Uah", configFile >> "CfgWeapons"]
		}] call BIS_fnc_sortBy;
		private _sum = 0;
		private _taken_banknotes = [];
		private _change = 0;
		private _change_banknotes = [];

		{
			_sum = _sum + getNumber (configFile >> "CfgWeapons" >> _x >> "value");
			_taken_banknotes pushBack _x;

			if (_sum >= _delta) then {
				break;
			};
		} forEach _player_banknotes;

		if (_sum < _delta) exitWith {
			systemChat format ["От бісова ковінька! Недостатньо грошей! Треба %1 грн, в наявності %2 грн.", _delta, _sum];
			_result = false;
		};

		_change = _sum - _delta;
		if (_change > 0) then {
			_change_banknotes = _change call FUNC(amountToBanknotes);
		};

		{
			_target removeItem _x
		} forEach _taken_banknotes;
		{
			_target addItem _x
		} forEach _change_banknotes;
	};
};

_result;