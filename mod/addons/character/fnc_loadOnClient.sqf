#include "script_component.hpp"
TRACE_1("trace", nil);

// Client only.
if (!hasInterface) exitWith {};
waitUntil {
	!isNull player
};

params ["_character"];

GVAR(character) = createHashMapFromArray call {
	_character;
};

// Whitelist.
if (!(GVAR(character) get "whitelisted")) exitWith {
	endMission "Whitelist";
};

// Ache.
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

call FUNC(initAutosave);