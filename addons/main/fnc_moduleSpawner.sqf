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
private _lootDefinitions = [];
// for each synchronized object.
{
	switch (true) do {
		// Units and ammoboxes are not deleted after reading. It's done this way in order to:
		// 1. Allow reusing the same inventory multiple times essentially creating "Loot Tables".
		// 2. Allow reusing the same unit groups multiple times in order to not copypaste them all over the place.
		case (_x isKindOf "Man"): {
			// for men only.
			private _group = group _x;
			private _groupDefinition = _groupsDefinitions get groupId _group;
			if (isNil "_groupDefinition") then {
				_groupDefinition = [side _x, []]
			};
			_groupDefinition#1 pushBack typeOf _x;
			_groupsDefinitions set [groupId _group, _groupDefinition];
		};
		case (_x isKindOf "ReammoBox_F"): {
			// for ammoboxes only.
			{
				private _type = _x#0;
				private _cargo = _x#1;
				for "_i" from 0 to ((count (_cargo#0)) - 1) do {
					_class = _cargo#0#_i;
					_amount = _cargo#1#_i;
					for "_i" from 0 to _amount do {
						_lootDefinitions pushBack [_type, _class];
					};
				};
			} forEach [["item", getItemCargo _x], ["weapon", getWeaponCargo _x], ["magazine", getMagazineCargo _x], ["backpack", getBackpackCargo _x]];
		};
		default {};
	};
	hideObject _x;
	_x enableSimulation false;
	_x allowDamage false;
	_x setPos [0, 0, 0];
} forEach synchronizedObjects _logic;
_logic setVariable ["groupsDefinitions", _groupsDefinitions];
_logic setVariable ["lootDefinitions", _lootDefinitions];

// set trigger statements.
_trigger setTriggerStatements ["this", "call" + " " + str {
	// Activated.
	private _logic = thisTrigger getVariable "logic";
	private _lastActivatedTime = _logic getVariable "lastActivatedTime";
	private _cooldown = _logic getVariable "Cooldown";
	private _buildingsPercentage = _logic getVariable "BuildingsPercentage";

	// Check cooldown.
	if (!isNil "_lastActivatedTime" && time - _lastActivatedTime < _cooldown) exitWith {};
	// Save last activation time.
	_logic setVariable ["lastActivatedTime", time];

	// load remaining variables.
	private _logicArea = _logic getVariable "objectArea";
	private _area_m2 = _logicArea#0 * _logicArea#1;
	if (!(_logicArea#3)) then {
		_area_m2 = (pi / 4) * _area_m2;
	};
	private _max_deviation = _logic getVariable "MaxDeviation";
	private _deviation = 1 - _max_deviation + (random (_max_deviation * 2));

	// spawn units.
	private _unitDensity = _logic getVariable "UnitDensity";
	private _units_count = ceil (_area_m2 * _unitDensity * _deviation);
	private _groupsDefinitions = _logic getVariable "groupsDefinitions";
	private _units = [];
	for "_" from 1 to _units_count do {
		_groupDefinition = selectRandom (values _groupsDefinitions);
		private _group = createGroup (_groupDefinition#0);
		{
			// find random position.
			private _pos = [ _logic, _logicArea] call BIS_fnc_randomPosTrigger;
			_pos set [2, 0];

			if (random 1 < _buildingsPercentage) then {
				// try to find building position half the time.
				private _suitable_building_positions = [];
				{
					_suitable_building_positions = _suitable_building_positions + (_x buildingPos -1);
				} forEach nearestObjects [_pos, ["House"], 50];
				_building_pos = selectRandom _suitable_building_positions;
				// if found - replace original position with building position.
				if (!isNil "_building_pos") then {
					_pos = _building_pos;
				};
			} else {
				// find safe position on the ground the other half time.
				private _safe_pos = [_pos, 0, 10, 5] call BIS_fnc_findSafePos;
				if (!isNil "_safe_pos") then {
					_pos = _safe_pos;
				};
			};

			// spawn unit.
			private _unit = _group createUnit [_x, _pos, [], 0, "NONE"];
			_unit setDir ([0, 360] call BIS_fnc_randomInt);
			_units pushBack _unit;
		} forEach (_groupDefinition#1);
		_group deleteGroupWhenEmpty true;
	};
	_logic setVariable ["units", _units];

	// spawn items.
	private _lootDensity = _logic getVariable "LootDensity";
	private _loot_count = ceil (_area_m2 * _lootDensity * _deviation);
	private _handlers = createHashMapFromArray [
		["item", {
			_this#0 addItemCargoGlobal [_this#1, _this#2]
		}],
		["weapon", {
			_this#0 addWeaponCargoGlobal [_this#1, _this#2]
		}],
		["magazine", {
			_this#0 addMagazineCargoGlobal [_this#1, _this#2]
		}],
		["backpack", {
			_this#0 addItemCargoGlobal [_this#1, _this#2]
		}]
	];
	private _lootDefinitions = _logic getVariable "lootDefinitions";

	private _lootContainers = [];
	for "_" from 1 to _loot_count do {
		// Decide which item do we spawn.
		(selectRandom _lootDefinitions) params ["_type", "_class"];
		// select handler.
		private _handler = _handlers get _type;

		// find position.
		private _pos = [getPosASL _logic, _logicArea] call BIS_fnc_randomPosTrigger;
		_pos set [2, 0];
		if (random 1 < _buildingsPercentage) then {
			// try to find building position half the time.
			private _suitable_building_positions = [];
			{
				_suitable_building_positions = _suitable_building_positions + (_x buildingPos -1);
			} forEach nearestObjects [_pos, ["House"], 50];
			_building_pos = selectRandom _suitable_building_positions;
			// if found - replace original position with building position.
			if (!isNil "_building_pos") then {
				_pos = _building_pos;
			};
		} else {
			// find safe position on the ground the other half time.
			private _safe_pos = [_pos, 0, 10, 5] call BIS_fnc_findSafePos;
			if (!isNil "_safe_pos") then {
				_pos = _safe_pos;
			};
		};

		// spawn item.
		_object = createVehicle ["GroundWeaponHolder", _pos, [], 0];
		_object setDir ([0, 360] call BIS_fnc_randomInt);
		[_object, _class, 1] call _handler;
		_lootContainers pushBack _object;
	};
	_logic setVariable ["lootContainers", _lootContainers];

	// spawn anomalies.
	private _anomalyDensity = _logic getVariable "AnomalyDensity";
	private _anomalyCount = ceil (_area_m2 * _anomalyDensity * _deviation);

	private _anomalyHandlers = [];
	if (_logic getVariable "AnomaliesBurner") then {
		_anomalyHandlers pushBack anomaly_fnc_createBurner;
	};
	if (_logic getVariable "AnomaliesElectra") then {
		_anomalyHandlers pushBack anomaly_fnc_createElectra;
	};
	if (_logic getVariable "AnomaliesFog") then {
		_anomalyHandlers pushBack anomaly_fnc_createFog;
	};
	if (_logic getVariable "AnomaliesFruitPunch") then {
		_anomalyHandlers pushBack anomaly_fnc_createFruitPunch;
	};
	if (_logic getVariable "AnomaliesMeatgrinder") then {
		_anomalyHandlers pushBack anomaly_fnc_createMeatgrinder;
	};
	if (_logic getVariable "AnomaliesSpringboard") then {
		_anomalyHandlers pushBack anomaly_fnc_createSpringboard;
	};

	private _anomalies = [];
	for "_" from 1 to _anomalyCount do {
		if (count _anomalyHandlers == 0) then {
			break;
		};

		// Decide which anomaly do we spawn.
		_anomalyHandler = selectRandom _anomalyHandlers;

		// find position.
		private _pos = [getPosASL _logic, _logicArea] call BIS_fnc_randomPosTrigger;
		_pos set [2, 0];
		if (random 1 > 0.5) then {
			// try to find building position half the time.
			private _suitable_building_positions = [];
			{
				_suitable_building_positions = _suitable_building_positions + (_x buildingPos -1);
			} forEach nearestObjects [_pos, ["House"], 50];
			_building_pos = selectRandom _suitable_building_positions;
			// if found - replace original position with building position.
			if (!isNil "_building_pos") then {
				_pos = _building_pos;
			};
		} else {
			// find safe position on the ground the other half time.
			private _safe_pos = [_pos, 0, 10, 5] call BIS_fnc_findSafePos;
			if (!isNil "_safe_pos") then {
				_pos = _safe_pos;
			};
		};

		// spawn anomaly.
		_anomalies pushBack ([_pos] call _anomalyHandler);
	};
	_logic setVariable ["anomalies", _anomalies];
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
	// anomalies.
	private _anomalies = _logic getVariable "anomalies";
	if (!isNil "_anomalies") then {
		{
			deleteVehicle _x;
		} forEach _anomalies;
	};
}];

true;