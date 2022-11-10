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

params ["_character"];

// Immediately save character data as a global variable.
GVAR(character) = createHashMapFromArray call {
	_character;
};

// Check if user is whitelisted.
if (!(GVAR(character) get "whitelisted")) exitWith {
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
} forEach (GVAR(character) get "ache");

// Engineer.
player setUnitTrait ["engineer", GVAR(character) get "engineer" > 0];
player setVariable ["ace_isengineer", GVAR(character) get "engineer", true];

// Medic.
player setUnitTrait ["medic", GVAR(character) get "medic" > 0];
player setVariable ["ace_medical_medicclass", GVAR(character) get "medic", true];

// Explosive Specialist.
player setUnitTrait ["explosiveSpecialist", GVAR(character) get "explosive_specialist"];

// Firearms skill.
player setCustomAimCoef (GVAR(character) get "aim_coef");
player setUnitRecoilCoefficient (GVAR(character) get "recoil_coef");

// Ninja skills.
player setUnitTrait ["camouflageCoef", GVAR(character) get "camouflage_coef"];
player setUnitTrait ["audibleCoef", GVAR(character) get "audible_coef"];

// set unit position and direction.
player setPosATL (GVAR(character) get "pos");
player setDir (GVAR(character) get "dir");

// set unit inventory.
player setUnitLoadout (GVAR(character) get "loadout");

// Character is loaded, initialize autosave.
call FUNC(initAutosave);