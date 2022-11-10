#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Initialize increased fuel consumption for players.
	
	call FUNC(...);
*/

// Client only.
if (!hasInterface) exitWith {};
waitUntil {
	!isNull player
};

private ["_kp_neutral_consumption", "_kp_normal_consumption", "_kp_max_consumption"];

/*
	CONFIG
*/
// time in Minutes till a full tank depletes when the vehicle is standing with running engine
_kp_neutral_consumption = 180;
// time in Minutes till a full tank depletes when the vehicle is driving
_kp_normal_consumption = 60;
// time in Minutes till a full tank depletes when the vehicle is driving at max speed
_kp_max_consumption = 30;

/*
	do not EDIT BELOW
*/

kp_fuel_consumption_vehicles = RETDEF(kp_fuel_consumption_vehicles, []);

if (!((_this select 0) in kp_fuel_consumption_vehicles)) then {
	kp_fuel_consumption_vehicles pushBack (_this select 0);
	while { local (_this select 0) } do {
		if (isEngineOn (_this select 0)) then {
			if (speed (_this select 0) > 5) then {
				if (speed (_this select 0) > (getNumber (configFile >> "CfgVehicles" >> typeOf (_this select 0) >> "maxSpeed") * 0.9)) then {
					(_this select 0) setFuel (fuel (_this select 0) - (1 / (_kp_max_consumption * 60)));
				} else {
					(_this select 0) setFuel (fuel (_this select 0) - (1 / (_kp_normal_consumption * 60)));
				};
			} else {
				(_this select 0) setFuel (fuel (_this select 0) - (1 / (_kp_neutral_consumption * 60)));
			};
		};
		uiSleep 1;
	};
	kp_fuel_consumption_vehicles deleteAt (kp_fuel_consumption_vehicles find (_this select 0));
};