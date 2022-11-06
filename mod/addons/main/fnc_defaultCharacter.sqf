#include "script_component.hpp"
TRACE_1("trace", nil);

[
	["name", profileName],
	["whitelisted", false],
	["pos", getMarkerPos "respawn_INDEPENDENT"],
	["dir", 0],
	["loadout", []],

	["driver", ["Car", "Motorcycle"]],
	["turret", ["Car", "Motorcycle"]],
	["ache", []], // Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg
	["explosive_specialist", false],

	["aim_coef", 5.0],
	["recoil_coef", 5.0],
	["camouflage_coef", 1.0],
	["audible_coef", 1.0],

	["medic", 0], // 0, 1, 2
	["engineer", 0] // 0, 1, 2
]