#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Initialize spawner modules.
	
	call FUNC(...);
*/
// Server only.
if (!isServer) exitWith {};

// Populate spawner modules with types.
{
	_logic = _x;
	private _unitClasses = _logic getVariable "unitClasses";
	if (isNil "_unitClasses") then {
		_unitClasses = [];
		private _units = (getPos _logic) nearEntities ["Man", 10];
		{
			_unitClasses pushBack typeOf _x;
			deleteVehicle _x;
		} forEach _units;
		_logic setVariable ["unitClasses", _unitClasses];
	};
} forEach entities "JAGER_main_moduleUnitSpawner";