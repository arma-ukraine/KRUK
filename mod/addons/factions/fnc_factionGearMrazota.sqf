#include "script_component.hpp"
TRACE_1("trace", nil);

/*
	Randomizes given faction unit.
	
	_unit call FUNC(...);
*/

params ['_unit'];

// Unit must be local.
if (!(local _unit)) exitWith {};

// Remove all gear.
removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

private _food_items = [
	"ACE_MRE_BeefStew",
	"ACE_MRE_ChickenTikkaMasala",
	"ACE_MRE_ChickenHerbDumplings",
	"ACE_MRE_CreamChickenSoup",
	"ACE_MRE_CreamTomatoSoup",
	"ACE_MRE_LambCurry",
	"ACE_MRE_MeatballsPasta_Item",
	"ACE_MRE_SteakVegetables_Item"
];

// set gear.
switch (typeOf _unit) do
{
	case "JAGER_factions_Mrazota_Melee_Fists": {
		// Add uniform.
		_unit forceAddUniform "U_I_C_Soldier_Bandit_4_F";

		// Add goggles.
		_unit addGoggles "G_Balaclava_blk";

		// Add water and food.
		if ((random 1) <= 0.1) then {
			_unit addItem "ACE_WaterBottle";
		};
		if ((random 1) <= 0.1) then {
			_unit addItem (selectRandom _food_items);
		};

		// Add money.
		switch (rank _unit) do
		{
			case "PRIVATE": {
				[_unit, random [1, 5, 10]] call JAGER_money_fnc_addMoney;
			};
			case "CORPORAL": {
				[_unit, random [10, 12, 20]] call JAGER_money_fnc_addMoney;
			};
			case "SERGEANT": {
				[_unit, random [20, 25, 50]] call JAGER_money_fnc_addMoney;
			};
			case "LIEUTENANT": {
				[_unit, random [50, 60, 100]] call JAGER_money_fnc_addMoney;
			};
			case "CAPTAIN": {
				[_unit, random [150, 160, 200]] call JAGER_money_fnc_addMoney;
			};
			case "MAJOR": {
				[_unit, random [200, 210, 250]] call JAGER_money_fnc_addMoney;
			};
			case "COLONEL": {
				[_unit, random [250, 260, 500]] call JAGER_money_fnc_addMoney;
			};
		};
	};
	case "JAGER_factions_Mrazota_Melee_Weapon": {
		hint "two";
	};
};