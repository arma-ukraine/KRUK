#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Standard Killed handler. Just add some money to Mrazota faction.
*/

params ["_unit", "_killer", "_instigator", "_useEffects"];

// Make sure unit is not a player.
if (isPlayer _unit) exitWith {};

// Make sure unit is an infantry unit.
if (!(_unit isKindOf "Man")) exitWith {};

// Make sure unit is opfor.
if (faction _unit != "O_MovariMrazota") exitWith {};

// Add some money to the unit depending on it's rank.
switch (rank _unit) do
{
	case "PRIVATE": {
		[_unit, random [1, 5, 10]] call FUNC(addMoney);
	};
	case "CORPORAL": {
		[_unit, random [10, 12, 20]] call FUNC(addMoney);
	};
	case "SERGEANT": {
		[_unit, random [20, 25, 50]] call FUNC(addMoney);
	};
	case "LIEUTENANT": {
		[_unit, random [50, 60, 100]] call FUNC(addMoney);
	};
	case "CAPTAIN": {
		[_unit, random [150, 160, 200]] call FUNC(addMoney);
	};
	case "MAJOR": {
		[_unit, random [200, 210, 250]] call FUNC(addMoney);
	};
	case "COLONEL": {
		[_unit, random [250, 260, 500]] call FUNC(addMoney);
	};
};