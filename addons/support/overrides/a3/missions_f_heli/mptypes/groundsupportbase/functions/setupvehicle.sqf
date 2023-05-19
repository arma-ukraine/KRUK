private["_vehicle", "_base", "_vehicleClass"];

_vehicle	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_base = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_vehicleClass	= typeOf _vehicle;

if (isNull _vehicle) exitWith {
	["[x] Cannot re-setup the vehicle upon respawn!"] call BIS_fnc_error;
};

// setup vehicle lock
[_vehicle, "init"] call bis_fnc_moduleMPTypeGroundSupportBase_lockHelicopter;

// gather info about helicopter initial state
_vehicle setVariable ["bis_initDamage", damage _vehicle, true];
_vehicle setVariable ["bis_initFuel", fuel _vehicle, true];
_vehicle setVariable ["bis_initMagazines", _vehicle call bis_fnc_moduleMPTypeGroundSupportBase_getVehicleAmmo, true];

// resupply vehicle
_vehicle call bis_fnc_moduleMPTypeGroundSupportBase_resupplyVehicle;

// clear vehicle cargo
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

private["_group"];

_group = group _vehicle;

// add even handler: GetIn & GetOut
_vehicle setVariable ["bis_crewGroup", _group, true];
_vehicle addEventHandler ["GetIn", bis_fnc_moduleMPTypeGroundSupportBase_onVehicleEntered];
_vehicle addEventHandler ["GetOut", bis_fnc_moduleMPTypeGroundSupportBase_onVehicleLeft];
// add even handler: RopeAttach to flag sling loaded cargo with last owner
_vehicle addEventHandler ["RopeAttach", {
	if ((_this select 2) isKindOf "ReammoBox_F") then {
		(_this select 2) setVariable ["BIS_lastSlingloadOwner", driver (_this select 0), true];
	};
}];

// start vehicle simulation
_vehicle setVelocity [0, 0, 1];

// add action to clear crew
[_vehicle, ["Звільнити машину", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	{
		_target deleteVehicleCrew _x;
	} forEach crew _target;
},
nil,
1.5,
true,
true,
"",
"true", // _target, _this, _originalTarget
5,
false,
"",
""]] remoteExec ["addAction"];

// start the helicopter fsm
_fsm = [_vehicle, _base] execFSM "\A3\Missions_F_Heli\MPTypes\GroundSupportBase\fsms\helicopter.fsm";
_vehicle setVariable ["bis_fsm", _fsm, true];

waitUntil{
	sleep 1;
	completedFSM _fsm;
};

// ["[i] Vehicle is going to respawn: _vehicle = %1 | _base = %2 | _vehicleClass = %3", _vehicle, _base, _vehicleClass] call BIS_fnc_logFormat;

// respawn helicopter
[_base, _vehicleClass] call bis_fnc_moduleMPTypeGroundSupportBase_respawnVehicle;