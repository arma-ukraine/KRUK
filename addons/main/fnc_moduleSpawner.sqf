#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Spawner module - spawns units and loot.
	
	call FUNC(...);
*/
// Server only.
if (!isServer) exitWith {};
params ["_logic"];
private _spawnActivationDistance = _logic getVariable "SpawnActivationDistance";

// Create activation trigger.
private _logicArea = _logic getvariable "objectArea";
_trigger = createTrigger ["EmptyDetector", getPosASL _logic, false];
_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true]; // repeating
_trigger setTriggerArea [_logicArea#0 + _spawnActivationDistance, _logicArea#1 + _spawnActivationDistance, getDir _logic, false];
_trigger setVariable ["logic", _logic];

// Collect objects for spawning.
// groups
private _groupsDefinitions = createHashMap;
private _lootDefinitions = createHashMapFromArray [
	["items", createHashMap],
	["weapons", createHashMap],
	["magazines", createHashMap],
	["backpacks", createHashMap]
];
// for each synchronized object.
{
	switch (true) do {
		// for men only.
		case (_x isKindOf "Man"): {
			private _group = group _x;
			private _groupDefinition = _groupsDefinitions get groupId _group;
			if (isNil "_groupDefinition") then {
				_groupDefinition = [side _x, []]
			};
			_groupDefinition#1 pushBack typeOf _x;
			_groupsDefinitions set [groupId _group, _groupDefinition];
		};
		case (_x isKindOf "ReammoBox_F"): {
			{
				private _cargo = _x#1;
				private _lootDefinition = _lootDefinitions get _x#0;
				for "_i" from 0 to ((count (_cargo#0)) - 1) do {
					_class = _cargo#0#_i;
					_amount = _cargo#1#_i;
					_stored_amount = _lootDefinition get _class;
					if (isNil "_stored_amount") then {
						_lootDefinition set [_class, _amount];
					} else {
						_lootDefinition set [_class, _stored_amount + _amount];
					};
				};
			} forEach [["items", getItemCargo _x], ["weapons", getWeaponCargo _x], ["magazines", getMagazineCargo _x], ["backpacks", getBackpackCargo _x]];
		};
		default {};
	};
	deleteVehicle _x;
} forEach synchronizedObjects _logic;
_logic setVariable ["groupsDefinitions", _groupsDefinitions];
_logic setVariable ["lootDefinitions", _lootDefinitions];

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
		_groupDefinition = selectRandom (values _groupsDefinitions);
		private _group = createGroup (_groupDefinition#0);
		{
			private _pos = [ _logic, _logicArea] call BIS_fnc_randomPosTrigger;
			_pos set [2, 0];
			private _unit = _group createUnit [_x, _pos, [], 0, "NONE"];
			_unit setDir ([0, 360] call BIS_fnc_randomInt);
			_units pushBack _unit;
		} forEach (_groupDefinition#1);
		_group deleteGroupWhenEmpty true;
	};
	_logic setVariable ["units", _units];

	// spawn items.
	private _handlers = [
		["items", {
			_this#0 addItemCargoGlobal [_this#1, _this#2]
		}],
		["weapons", {
			_this#0 addWeaponCargoGlobal [_this#1, _this#2]
		}],
		["magazines", {
			_this#0 addMagazineCargoGlobal [_this#1, _this#2]
		}],
		["backpacks", {
			_this#0 addItemCargoGlobal [_this#1, _this#2]
		}]
	];
	private _lootDefinitions = _logic getVariable "lootDefinitions";
	private _lootContainers = [];
	{
		private _handler = _x#1;
		private _definitions = _lootDefinitions get _x#0;
		{
			private _class = _x;
			private _amount = _y;
			for "_" from 1 to _amount do {
				private _pos = [getPosASL _logic, _logicArea] call BIS_fnc_randomPosTrigger;
				_pos set [2, 0];
				_object = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
				_object setDir ([0, 360] call BIS_fnc_randomInt);
				[_object, _class, 1] call _handler;
				_lootContainers pushBack _object;
			};
		} forEach _definitions;
	} forEach _handlers;
	_logic setVariable ["lootContainers", _lootContainers];
}, "call" + " " + str {
	// Deactivated.
	private _logic = thisTrigger getVariable "logic";
	// units.
	private _units = _logic getVariable "units";
	if (!isNil "_units") then {
		{
			deleteVehicle _x;
		} forEach _units;
	};
	// items.
	private _lootContainers = _logic getVariable "lootContainers";
	if (!isNil "_lootContainers") then {
		{
			deleteVehicle _x;
		} forEach _lootContainers;
	};
}];

true;