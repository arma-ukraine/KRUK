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

handler = {
	_this spawn {
		params ["_", "_", "_vehicle", "_"];
		private ["_idle_consumed_in", "_normal_consumed_in", "_max_consumed_in"];

		// time in Minutes till a full tank depletes when the vehicle is standing with running engine
		_idle_consumed_in = 60;
		// time in Minutes till a full tank depletes when the vehicle is driving
		_normal_consumed_in = 45;
		// time in Minutes till a full tank depletes when the vehicle is driving at max speed
		_max_consumed_in = 30;

		kp_fuel_consumption_vehicles = RETDEF(kp_fuel_consumption_vehicles, []);
		if (!((_vehicle) in kp_fuel_consumption_vehicles)) then {
			kp_fuel_consumption_vehicles pushBack (_vehicle);
			while { local (_vehicle) } do {
				if (isEngineOn (_vehicle)) then {
					if (speed (_vehicle) > 5) then {
						if (speed (_vehicle) > (getNumber (configFile >> "CfgVehicles" >> typeOf (_vehicle) >> "maxSpeed") * 0.9)) then {
							(_vehicle) setFuel (fuel (_vehicle) - (1 / (_max_consumed_in * 60)));
						} else {
							(_vehicle) setFuel (fuel (_vehicle) - (1 / (_normal_consumed_in * 60)));
						};
					} else {
						(_vehicle) setFuel (fuel (_vehicle) - (1 / (_idle_consumed_in * 60)));
					};
				};
				sleep 1;
			};
			kp_fuel_consumption_vehicles deleteAt (kp_fuel_consumption_vehicles find (_vehicle));
		};
	};
};

player addEventHandler ["GetInMan", handler];
player addEventHandler ["SeatSwitchedMan", handler];