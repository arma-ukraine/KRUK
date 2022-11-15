#include "script_component.hpp"
TRACE_1("trace", nil);

/*
	Randomizes given faction unit.
	
	_unit call FUNC(...);
*/

params ['_unit'];

// Unit must be local.
if (!(local _unit)) exitWith {};

// Disable randomization.
_unit setVariable ["BIS_enableRandomization", false];

// Remove all gear.
removeAllWeapons _unit;
removeAllItems _unit;
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
switch (true) do
{
	case (["JAGER_factions_Mrazota", typeOf _unit] call BIS_fnc_inString): {
		// Add uniform.
		_unit forceAddUniform (selectRandom [
			"U_I_C_Soldier_Bandit_1_F",
			"U_I_C_Soldier_Bandit_2_F",
			"U_I_C_Soldier_Bandit_3_F",
			"U_I_C_Soldier_Bandit_4_F",
			"U_I_C_Soldier_Bandit_5_F",
			"rds_uniform_citizen1",
			"rds_uniform_citizen2",
			"rds_uniform_citizen3",
			"rds_uniform_citizen4",
			"U_C_Poloshirt_blue",
			"U_C_Poloshirt_burgundy",
			"U_C_Poloshirt_redwhite",
			"U_C_Poloshirt_salmon",
			"U_C_Poloshirt_stripped",
			"U_C_Poloshirt_tricolour",
			"U_BG_Guerilla3_1",
			"U_C_HunterBody_grn",
			"U_C_E_LooterJacket_01_F",
			"U_I_L_Uniform_01_tshirt_black_F",
			"U_I_L_Uniform_01_tshirt_olive_F",
			"U_I_L_Uniform_01_tshirt_skull_F",
			"U_I_L_Uniform_01_tshirt_sport_F",
			"U_C_Mechanic_01_F",
			"rds_uniform_Villager1",
			"rds_uniform_Villager2",
			"rds_uniform_Villager3",
			"rds_uniform_Villager4",
			"rds_uniform_Woodlander1",
			"rds_uniform_Woodlander2",
			"rds_uniform_Woodlander3",
			"rds_uniform_Woodlander4",
			"rds_uniform_Worker1",
			"rds_uniform_Worker2",
			"rds_uniform_Worker3",
			"rds_uniform_Worker4",
			"U_C_Poor_1"
		]);

		// Add goggles.
		_unit addGoggles "G_Balaclava_blk";

		// Add water and food.
		if ((random 1) <= 0.05) then {
			_unit addItem "ACE_WaterBottle";
		};
		if ((random 1) <= 0.1) then {
			_unit addItem (selectRandom _food_items);
		};

		// Add some medicine.
		if ((random 1) <= 0.1) then {
			_unit addItem ("ACE_fieldDressing");
		};
		if ((random 1) <= 0.02) then {
			_unit addItem ("ACE_splint");
		};

		// Only for "melee weapon" units.
		if (["Melee_Weapon", typeOf _unit] call BIS_fnc_inString) then {
			// Add melee weapon.
			_unit addWeapon (selectRandom [
				"Pipe_aluminium",
				"Pipe_aluminium",
				"Pipe_aluminium",
				"Pipe_aluminium",
				"Pipe_aluminium",
				"Pipe_aluminium",
				"Pipe_aluminium",
				"Pipe_aluminium",
				"Pipe_aluminium",
				"Pipe_aluminium",
				"Rod",
				"Rod",
				"Rod",
				"Rod",
				"Rod",
				"Rod",
				"Rod",
				"Rod",
				"Rod",
				"Rod",
				"WBK_SmallHammer",
				"WBK_SmallHammer",
				"WBK_SmallHammer",
				"Bat_Clear",
				"Bat_Spike",
				"WBK_axe",
				"Crowbar"
			]);
		};

		// for Firearms_Handgun units.
		if (["Firearms_Handgun", typeOf _unit] call BIS_fnc_inString) then {
			private _random_handgun = selectRandom [
				"rhs_weap_6p53",
				"rhs_weap_cz99",
				"rhsusf_weap_glock17g4",
				"rhsusf_weap_m1911a1",
				"rhsusf_weap_m9",
				"hgun_Pistol_01_F",
				"rhs_weap_pya",
				"hgun_Rook40_F",
				"hgun_P07_F",
				"hgun_P07_blk_F",
				"rhs_weap_makarov_pm",
				"rhs_weap_savz61_folded",
				"rhs_weap_tt33",
				"rhs_weap_type94_new"
			];
			_unit addMagazines [selectRandom (_random_handgun call BIS_fnc_compatibleMagazines), 5];
			_unit addWeaponGlobal _random_handgun;
		};
	};
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