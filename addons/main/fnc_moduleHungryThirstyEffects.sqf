#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Remove equipment from dead enemies and players.
	
	call FUNC(...);
*/

// Client only.
if (!hasInterface) exitWith {};
waitUntil {
	!isNull player
};
params ["_logic"];
deleteVehicle _logic;

[] spawn {
	while { true } do {
		sleep ([300, 600] call BIS_fnc_randomInt); // Wait 5-10 minutes.
		private _hunger = player getVariable "acex_field_rations_hunger";
		if (!isNil "_hunger") then {
			if (_hunger > 50) then {
				player say3D "Hungry";
				["", "*хочеться їсти*"] spawn BIS_fnc_showSubtitle;
			};
		};
	};
};

[] spawn {
	while { true } do {
		sleep ([300, 600] call BIS_fnc_randomInt); // Wait 5-10 minutes.
		private _thirst = player getVariable "acex_field_rations_thirst";
		if (!isNil "_thirst") then {
			if (_thirst > 50) then {
				[] call ace_medical_feedback_fnc_effectIncapacitated;
				["", "*хочеться пити*"] spawn BIS_fnc_showSubtitle;
			};
		};
	};
};