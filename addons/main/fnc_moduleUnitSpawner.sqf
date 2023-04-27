#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Spawner module - creates units when synced triggers are activated.
	
	call FUNC(...);
*/

// Server only.
if (!isServer) exitWith {};

params ["_logic", "_units", "_is_activated"];

// Require synchronized objects.
if (count synchronizedObjects _logic == 0) exitWith {};
// SystemChat format["%1"]

// TODO: randomize spawn, may be use garrison.
// TODO: when non-red units are spawned - they go rogue. Need to fix it somehow.

// Populate unitClasses.
if (_is_activated) then {
	private _unitClasses = _logic getVariable "unitClasses";
	// private _logicArea = _logic getvariable "objectArea";
	// systemChat format["%1", _logicArea];
	// private _spawnMarker = createMarker ["markername", _logic];
	// private _spawnMarker setMarkerShape "RECTANGLE";
	// private _spawnMarker setMarkerSize [100, 100];

	// _spawnMarker = CreateArea;
	// deleteMarker _spawn_ma

	private _minGroupSize = _logic getVariable "MinGroupSize";
	private _maxGroupSize = _logic getVariable "MaxGroupSize";
	private _minGroups = _logic getVariable "MinGroups";
	private _maxGroups = _logic getVariable "MaxGroups";

	for "_" from 1 to ([_minGroups, _maxGroups] call BIS_fnc_randomInt) do {
		private _group = createGroup east;
		for "_" from 1 to ([_minGroupSize, _maxGroupSize] call BIS_fnc_randomInt) do {
			_group createUnit [selectRandom _unitClasses, getPos _logic, [], 0, "FORM"];
		};
	};

	// Collect units near the center of the area.
	// spawn units in the area.
} else {
	// Delete units.
};

true;

// params ["_activation_radius", "_spawn_radius"];

// Trigger area specifies activation.
// Module area specifies spawn.

// Parameters:
// - min group size
// - max group size
// - min groups
// - max groups
// - OPTIONAL: hunt the player
// Keep active as long as at least one player is within radius.
// Clean up all spawned units on deactivation.

// load units to spawn from within the area of the module, ratio of the units loaded must be taken into account during spawning.
// Generate activation trigger.
// spawn a bunch of units in random locations within the trigger once any player is present saving each unit spawned.
// Despawn units once player leaves the trigger.
// OPTIONAL: set up patrolling waypoints for units.
// OPTIONAL: Place units in buildings.