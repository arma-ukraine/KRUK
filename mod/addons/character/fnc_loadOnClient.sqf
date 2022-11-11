#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Callback to load player data on client.
	
	_character_data call FUNC(...);
*/

// Client only.
if (!hasInterface) exitWith {};
waitUntil {
	!isNull player
};

// get state and convert it to hashmap.
params ["_state", "_args"];
TRACE_1("character state:", _state);
_state = createHashMapFromArray _state;
TRACE_1("character state:", _state);

// Immediately save character data as a unit variable and broadcast it.
player setVariable [QGVAR(state), _state, true];

// Check if we are whitelisted.
if (!(_state get "whitelisted")) exitWith {
	endMission "Whitelist";
};

// Initialize aches if any.
{
	_x spawn {
		while { true } do {
			[player, 0.15, _this, "punch"] call ace_medical_fnc_addDamageToUnit;
			sleep (random 3600 + 1800); // Wait for 30-90 minutes.
		};
	};
} forEach (_state get "ache");

// Engineer.
player setUnitTrait ["engineer", _state get "engineer" > 0];
player setVariable ["ace_isengineer", _state get "engineer", true];

// Medic.
player setUnitTrait ["medic", _state get "medic" > 0];
player setVariable ["ace_medical_medicclass", _state get "medic", true];

// Explosive Specialist.
player setUnitTrait ["explosiveSpecialist", _state get "explosive_specialist"];

// Firearms skill.
player setCustomAimCoef (_state get "aim_coef");
player setUnitRecoilCoefficient (_state get "recoil_coef");

// Ninja skills.
player setUnitTrait ["camouflageCoef", _state get "camouflage_coef"];
player setUnitTrait ["audibleCoef", _state get "audible_coef"];

// set unit position and direction.
player setPosATL (_state get "pos");
player setDir (_state get "dir");

// set unit inventory.
player setUnitLoadout (_state get "loadout");