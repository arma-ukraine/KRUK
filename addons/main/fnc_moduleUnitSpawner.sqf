#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Spawner module - creates units when synced triggers are activated.
	
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

// load and store units and spawn area for spawning.
_unitClasses = [];
private "_side";
private _units = synchronizedObjects _logic;
{
	if (isNil "_side") then {
		_side = side group _x;
	};
	_unitClasses pushBack typeOf _x;
	deleteVehicle _x;
} forEach _units;
_logic setVariable ["unitClasses", _unitClasses];
_logic setVariable ["side", _side];

// set trigger statements.
_trigger setTriggerStatements ["this", "call" + " " + str {
	// Activated.
	private _logic = thisTrigger getVariable "logic";
	private _unitClasses = _logic getVariable "unitClasses";
	private _side = _logic getVariable "side";
	private _logicArea = _logic getVariable "objectArea";

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
}, "call" + " " + str {
	// Deactivated.
	private _logic = thisTrigger getVariable "logic";
	private _units = _logic getVariable "units";
	if (!isNil "_units") then {
		{
			deleteVehicle _x;
		} forEach _units;
	};
}];

true;