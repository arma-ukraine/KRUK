if (!isDedicated) then {
	waitUntil{
		!isNull player
	};
};

// wait for spawn AI functions are initialized
waitUntil{
	!(isNil{
		bis_fnc_moduleSpawnAI_main
	}) && {
		!(isNil{
			bis_fnc_moduleSpawnAISectorTactic_main
		})
	}
};

private _path = "\A3\Missions_F_Heli\MPTypes\GroundSupportBase";

/*--------------------------------------------------------------------------------------------------
	
	load FUNCTIONS
	
--------------------------------------------------------------------------------------------------*/
[
	format["%1\functions\", _path],
	"bis_fnc_moduleMPTypeGroundSupportBase_",
	[
		// "setupVehicle", - OVERRIDDEN, see below
		"setupPlayer",
		"createVehicleCrew",
		"resupplyVehicle",
		// "onVehicleEntered", - OVERRIDDEN, see below
		"onVehicleLeft",
		"respawnVehicle",
		"respawnPlayer",
		"evacGroup",
		"hidePlayer",
		"createCamera",
		"destroyCamera",
		"getVehicleAmmo",
		"setFuel",
		"setAmmo",
		"retreatGroup"
		// "lockHelicopter" - OVERRIDDEN, see below
	],
	false
]
call BIS_fnc_loadFunctions;

// KRUK OVERRIDES.
private _override_path = "\x\KRUK\addons\support\overrides\A3\Missions_F_Heli\MPTypes\GroundSupportBase";
[
	format["%1\functions\", _override_path],
	"bis_fnc_moduleMPTypeGroundSupportBase_",
	[
		"lockHelicopter",
		"onVehicleEntered",
		"setupVehicle"
	],
	false
]
call BIS_fnc_loadFunctions;
// END KRUK OVERRIDES

/*--------------------------------------------------------------------------------------------------
	
	EXECUTE MODULE FUNCTIONS
	
--------------------------------------------------------------------------------------------------*/
if (isServer) then {
	_this call compile preprocessFileLineNumbers format["%1\%2", _path, "initServer.sqf"];
};

// if (missionNamespace getVariable ["BIS_fnc_moduleMPTypeGroundSupportBase_executed", false]) exitWith {};
// BIS_fnc_moduleMPTypeGroundSupportBase_executed = true;

if !(isDedicated) then
{
	_this call compile preprocessFileLineNumbers format["%1\%2", _path, "initPlayerLocal.sqf"];
};