#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Remove some equipment from dead enemies and players.
	
	call FUNC(...);
*/

// Server only.
if (!isServer) exitWith {};

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	// Remove magazines for weapons unit has, but not for players.
	if (!(isPlayer _unit)) then {
		{
			{
				_unit removeMagazines _x;
			} forEach (_x call BIS_fnc_compatibleMagazines);
		} forEach weapons _unit;

		{
			_unit removeMagazineGlobal _x;
		} forEach magazines _unit;
	};

	// Remove weapons half the time.
	{
		if (random 1 < 0.5) then {
			_unit removeWeapon _x
		};
	} forEach weapons _unit;

	// Remove vests half the time.
	if (random 1 < 0.5) then {
		removeVest _unit;
	};

	// Remove backpacks half the time.
	if (random 1 < 0.5) then {
		removeBackpack _unit;
	};
}];