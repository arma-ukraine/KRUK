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

// Collect objects for spawning.
// groups
private ["_groupsDefinitions", "_side"];
_groupsDefinitions = [];
// for each synchronized object.
{
	switch (true) do {
		// for men only.
		case (_x isKindOf "Man"): {
			private _groupDefinition = [side _x, []];
			// Gather all units from the group and prepare group definition.
			{
				_groupDefinition#1 pushBack typeOf _x;
				deleteVehicle _x;
			} forEach units group _x;
			_groupsDefinitions pushBack _groupDefinition;
			// Delete object as we are not interested in it any more.
		};
		default {};
	};
} forEach synchronizedObjects _logic;
_logic setVariable ["groupsDefinitions", _groupsDefinitions];

// TODO: items

// set trigger statements.
_trigger setTriggerStatements ["this", "call" + " " + str {
	// Activated.
	private _logic = thisTrigger getVariable "logic";
	private _logicArea = _logic getVariable "objectArea";

	// spawn units.
	private _minGroups = _logic getVariable "MinGroups";
	private _maxGroups = _logic getVariable "MaxGroups";
	private _groupsDefinitions = _logic getVariable "groupsDefinitions";
	private _units = [];
	for "_" from 1 to ([_minGroups, _maxGroups] call BIS_fnc_randomInt) do {
		_groupDefinition = selectRandom _groupsDefinitions;
		private _group = createGroup (_groupDefinition#0);
		{
			private _unitPos = [getPos _logic, _logicArea] call BIS_fnc_randomPosTrigger;
			private _unit = _group createUnit [_x, _unitPos, [], 0, "FORM"];
			_units pushBack _unit;
		} forEach (_groupDefinition#1);
		_group deleteGroupWhenEmpty true;
	};
	_logic setVariable ["units", _units];

	if (true) exitWith {};
	// spawn items.
	// Parse items.
	// 1-3*ItemMap, 1-20*ItemWatch
	private _items = _logic getVariable "Items";
	{
		// Current result is saved in variable _x
		(_x splitString "*") params ["_counts", "_className"];
		(_counts splitString "-") params ["_countMin", "_countMax"];
		private _count = [_countMin, _countMax] call BIS_fnc_randomInt;
		for "_" from 1 to _count do {
			private _pos = [getPos _logic, _logicArea] call BIS_fnc_randomPosTrigger;
			_object = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
			_object addItemCargoGlobal [_classname, 1];
		};
	} forEach _items splitString ", ";

	// 

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