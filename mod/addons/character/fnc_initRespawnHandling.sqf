#include "script_component.hpp"
TRACE_1("trace", nil);

// Client only.
if (!hasInterface) exitWith {
	WARNING("initRespawn should only be called on the client.");
};

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	// Engineer.
	_unit setUnitTrait ["engineer", GVAR(character) get "engineer" > 0];
	_unit setVariable ["ace_isengineer", GVAR(character) get "engineer", true];

	// Medic.
	_unit setUnitTrait ["medic", GVAR(character) get "medic" > 0];
	_unit setVariable ["ace_medical_medicclass", GVAR(character) get "medic", true];

	// Explosive Specialist.
	_unit setUnitTrait ["explosiveSpecialist", GVAR(character) get "explosive_specialist"];

	// Firearms skill.
	_unit setCustomAimCoef (GVAR(character) get "aim_coef");
	_unit setUnitRecoilCoefficient (GVAR(character) get "recoil_coef");

	// Ninja skills.
	_unit setUnitTrait ["camouflageCoef", GVAR(character) get "camouflage_coef"];
	_unit setUnitTrait ["audibleCoef", GVAR(character) get "audible_coef"];
}];