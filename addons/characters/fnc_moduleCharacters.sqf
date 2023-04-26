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

// =================================================================================
// Characters database.
private _characters = createHashMap;
_characters set["default", createHashMapFromArray [ // default
	["driver", ["Car", "Motorcycle"]], // can drive cars and motorcycles by default
	["turret", ["Car", "Motorcycle"]], // can drive cars and motorcycles by default

	["aim_coef", 50.0],
	["recoil_coef", 50.0],
	["camouflage_coef", 2.0],
	["audible_coef", 2.0],

	["explosive_specialist", false],
	["medic", 0], // 0 - none, 1 - medic, 2 - doctor
	["engineer", 0] // 0 - none, 1 - engineer, 2 - advanced engineer
]];
_characters set["76561197999599845", createHashMapFromArray [ // DiRaven
	["medic", 1], // 0 - none, 1 - medic, 2 - doctor
	["explosive_specialist", true]
]];

// =================================================================================
// Retrieve current character data.
private _character = _characters get "default";
private _overrides = _characters get getPlayerUID player;
if (!isNil "_overrides") then {
	{
		_character set [_x, _y];
	} forEach _overrides;
};
player setVariable [QGVAR(character), _character, true];

// =================================================================================
// apply character data.
FUNC(applyCharacter) = {
	params ["_unit"];
	private _character = _unit getVariable QGVAR(character);

	// Engineer.
	_unit setUnitTrait ["engineer", _character get "engineer" > 0];
	_unit setVariable ["ace_isengineer", _character get "engineer", true];

	// Medic.
	_unit setUnitTrait ["medic", _character get "medic" > 0];
	_unit setVariable ["ace_medical_medicclass", _character get "medic", true];

	// Explosive Specialist.
	_unit setUnitTrait ["explosiveSpecialist", _character get "explosive_specialist"];

	// Firearms skill.
	_unit setCustomAimCoef (_character get "aim_coef");
	_unit setUnitRecoilCoefficient (_character get "recoil_coef");

	// Ninja skills.
	_unit setUnitTrait ["camouflageCoef", _character get "camouflage_coef"];
	_unit setUnitTrait ["audibleCoef", _character get "audible_coef"];
};
player call FUNC(applyCharacter);

// =================================================================================
// Handle respawns.
player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	private _character = _corpse getVariable QGVAR(character);
	_unit setVariable [QGVAR(character), _character, true];
	[_unit] call FUNC(applyCharacter);
}];

// =================================================================================
// Handle vehicle restrictions.
handleVehicleSeatEntered = {
	private _unit = _this;

	// if entity is a player.
	if (isPlayer _unit) then {
		private _role = (assignedVehicleRole _unit) select 0;
		private _vehicle = objectParent _unit;
		private _vehicle_category = _vehicle call BIS_fnc_objectType select 1;
		private _vehicle_type = typeOf _vehicle;

		// Make sure player has necessary role.
		if ((_role == "cargo") or (_vehicle_category in (GVAR(character) get _role)) or (_vehicle_type in (GVAR(character) get _role))) then {
			TRACE_4("allowed vehicle entry", _vehicle_type, _vehicle_category, _unit, _role);
		} else {
			// If player doesn't have necessary role - just kick him out.
			_unit moveOut _vehicle;
			"Ви не вмієте того робити." remoteExec ["systemChat", _unit];
			TRACE_4("denied vehicle entry", _vehicle_type, _vehicle_category, _unit, _role);
		};
	};
};
// Initialize driving limitations handlers.
player addEventHandler ["GetInMan", {
	params ["_unit"];
	_unit call handleVehicleSeatEntered;
}];
player addEventHandler ["SeatSwitchedMan", {
	params ["_unit1", "_unit2"];
	_unit1 call handleVehicleSeatEntered;
	_unit2 call handleVehicleSeatEntered;
}];