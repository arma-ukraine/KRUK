#include "script_component.hpp"
TRACE_1("trace", nil);

/*
	Randomizes given faction unit.
	
	_unit call FUNC(...);
*/

params ['_unit'];

if (local _unit) then {
	// Give random primary weapon.
	_choices = getArray ((configOf _unit) >> 'primaryWeaponsPool');
	if (count _choices > 0) then {
		private _choice = selectRandom _choices;
		_unit addWeapon _choice;
	};

	// Give random secondary weapon.
	_choices = getArray ((configOf _unit) >> 'secondaryWeaponsPool');
	if (count _choices > 0) then {
		private _choice = selectRandom _choices;
		_unit addWeapon _choice;
	};
};