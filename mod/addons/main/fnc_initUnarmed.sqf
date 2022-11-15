#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Automatically change player side depending on whether he has weapons.
	
	call FUNC(...);
*/

// Client only.
if (!hasInterface) exitWith {};
waitUntil {
	!isNull player
};

[] spawn {
	while { true } do {
		sleep 60;
		if (count (weapons player) == 0) then {
			private _tmp_group = createGroup civilian;
			[player] joinSilent _tmp_group;
			_tmp_group deleteGroupWhenEmpty true;
		} else {
			private _tmp_group = createGroup independent;
			[player] joinSilent _tmp_group;
			_tmp_group deleteGroupWhenEmpty true;
		};
	};
};