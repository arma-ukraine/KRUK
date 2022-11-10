#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Generate fresh character.
	
	_character = [] call FUNC(...);
*/

[
	["name", profileName], // just so that we can find him later
	["whitelisted", false],
	["pos", getMarkerPos "respawn_INDEPENDENT"], // may be we should change it to something else later
	["dir", 0],
	["loadout", []],

	["driver", ["Car", "Motorcycle"]], // can drive cars and motorcycles by default
	["turret", ["Car", "Motorcycle"]], // can drive cars and motorcycles by default
	["ache", []], // Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg
	["explosive_specialist", false],

	["aim_coef", 50.0],
	["recoil_coef", 50.0],
	["camouflage_coef", 2.0],
	["audible_coef", 2.0],

	["medic", 0], // 0 - none, 1 - medic, 2 - doctor
	["engineer", 0] // 0 - none, 1 - engineer, 2 - advanced engineer
]