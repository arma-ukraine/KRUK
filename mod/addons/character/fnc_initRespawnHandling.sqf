#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Restore unit properties and remove gear on respawn.
	
	call FUNC(...);
*/

// Client only.
if (!hasInterface) exitWith {};
waitUntil {
	!isNull player
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

	private _state = _corpse getVariable QGVAR(state);
	_unit setVariable [QGVAR(state), _state, true];

	// Engineer.
	_unit setUnitTrait ["engineer", _state get "engineer" > 0];
	_unit setVariable ["ace_isengineer", _state get "engineer", true];

	// Medic.
	_unit setUnitTrait ["medic", _state get "medic" > 0];
	_unit setVariable ["ace_medical_medicclass", _state get "medic", true];

	// Explosive Specialist.
	_unit setUnitTrait ["explosiveSpecialist", _state get "explosive_specialist"];

	// Firearms skill.
	_unit setCustomAimCoef (_state get "aim_coef");
	_unit setUnitRecoilCoefficient (_state get "recoil_coef");

	// Ninja skills.
	_unit setUnitTrait ["camouflageCoef", _state get "camouflage_coef"];
	_unit setUnitTrait ["audibleCoef", _state get "audible_coef"];
}];