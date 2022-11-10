#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Fixes loadout to not top up magazines in player inventory.
	
	_fixed_loadout = _original_loadout call FUNC(...);
*/

_loadout = _this;

private ["_loadout", "_uniform", "_type", "_vest", "_backpack"];

// uniform
if (count (_loadout select 3) > 0) then {
	_uniform = ((_loadout select 3) select 1);
	{
		_type = (_x select 0) call BIS_fnc_itemType;
		if (((_type select 1) isEqualTo "Bullet") && {
			(_x select 1) >= 2 && {
				(_x select 2) != (getNumber(configFile >> "cfgMagazines" >> (_x select 0) >> "count"))
			}
		}) then
		{
			((_loadout select 3) select 1) set [_forEachIndex, [(_x select 0), 1, (_x select 2)]];
			for "_i" from 1 to (_x select 1)-1 do
			{
				((_loadout select 3) select 1) pushBack [(_x select 0), 1, (_x select 2)];
			};
		};
	} forEach _uniform;
};

// vest
if (count (_loadout select 4) > 0) then {
	_vest = ((_loadout select 4) select 1);
	{
		_type = (_x select 0) call BIS_fnc_itemType;
		if (((_type select 1) isEqualTo "Bullet") && {
			(_x select 1) >= 2 && {
				(_x select 2) != (getNumber(configFile >> "cfgMagazines" >> (_x select 0) >> "count"))
			}
		}) then
		{
			((_loadout select 4) select 1) set [_forEachIndex, [(_x select 0), 1, (_x select 2)]];
			for "_i" from 1 to (_x select 1)-1 do
			{
				((_loadout select 4) select 1) pushBack [(_x select 0), 1, (_x select 2)];
			};
		};
	} forEach _vest;
};

// backpack
if (count (_loadout select 5) > 0) then {
	_backpack = ((_loadout select 5) select 1);
	{
		_type = (_x select 0) call BIS_fnc_itemType;
		if (((_type select 1) isEqualTo "Bullet") && {
			(_x select 1) >= 2 && {
				(_x select 2) != (getNumber(configFile >> "cfgMagazines" >> (_x select 0) >> "count"))
			}
		}) then
		{
			((_loadout select 5) select 1) set [_forEachIndex, [(_x select 0), 1, (_x select 2)]];
			for "_i" from 1 to (_x select 1)-1 do
			{
				((_loadout select 5) select 1) pushBack [(_x select 0), 1, (_x select 2)];
			};
		};
	} forEach _backpack;
};
_loadout