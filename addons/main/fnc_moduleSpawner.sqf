#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Spawner module - spawns units and loot.
	
	call FUNC(...);
*/
// Server only.
if (!isServer) exitWith {};
params ["_logic", "_units", "_is_activated"];
private _spawnActivationDistance = _logic getVariable "SpawnActivationDistance";

// Create activation trigger.
private _logicArea = _logic getvariable "objectArea";
_trigger = createTrigger ["EmptyDetector", getPos _logic, false];
_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true]; // repeating
_trigger setTriggerArea [_logicArea#0 + 2 * _spawnActivationDistance, _logicArea#1 + 2 * _spawnActivationDistance, getDir _logic, false];
_trigger setVariable ["logic", _logic];

// set trigger statements.
_trigger setTriggerStatements ["this", "call" + " " + str {
	// Activated.
	private _logic = thisTrigger getVariable "logic";
	private _logicArea = _logic getVariable "objectArea";

	// units.
	private _side = call compile (_logic getVariable "UnitsSide");
	private _unitClasses = _logic getVariable "UnitsClasses" splitString ", ";
	private _minGroupSize = _logic getVariable "MinGroupSize";
	private _maxGroupSize = _logic getVariable "MaxGroupSize";
	private _minGroups = _logic getVariable "MinGroups";
	private _maxGroups = _logic getVariable "MaxGroups";

	private _units = [];
	for "_" from 1 to ([_minGroups, _maxGroups] call BIS_fnc_randomInt) do {
		private _group = createGroup _side;
		for "_" from 1 to ([_minGroupSize, _maxGroupSize] call BIS_fnc_randomInt) do {
			private _unitPos = [getPos _logic, _logicArea] call BIS_fnc_randomPosTrigger;
			private _unit = _group createUnit [selectRandom _unitClasses, _unitPos, [], 0, "FORM"];
			_units pushBack _unit;
			// sleep 1;
		};
		_group deleteGroupWhenEmpty true;
	};
	_logic setVariable ["units", _units];

	// items.
	// Parse items.
	// _object = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
	// _object addItemCargoGlobal [_classname, 1];

	// spawn.
	// Save all spawned containers.
}, "call" + " " + str {
	// Deactivated.
	// units.
	private _logic = thisTrigger getVariable "logic";
	private _units = _logic getVariable "units";
	if (!isNil "_units") then {
		{
			deleteVehicle _x;
		} forEach _units;
	};
	// items.
}];

true;