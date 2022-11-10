#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_uid"];

private _local_uid = getPlayerUID player;

if (_uid == _local_uid) exitWith {
	private _location = format ["%1/character", _uid];

	private _loadout = (getUnitLoadout player) call FUNC(fixLoadoutMagazines);
	if (GVARMAIN(tfarLoaded)) then {
		private _assignedRadio = (_loadout select 9) select 2;
		if (_assignedRadio call TFAR_fnc_isRadio) then {
			(_loadout select 9) set [2, [configFile >> "CfgWeapons" >> _assignedRadio >> "tf_parent", "text", _assignedRadio] call CBA_fnc_getConfigEntry];
		};

		private _fnc_replaceRadioTfar = {
			params ["_item"];
			if (!(_item isEqualType []) && {
				_item call TFAR_fnc_isRadio
			}) then {
				_this set [0, [configFile >> "CfgWeapons" >> _item >> "tf_parent", "text", _item] call CBA_fnc_getConfigEntry];
			};
		};
		if !((_loadout select 3) isEqualTo []) then {
			{
				_x call _fnc_replaceRadioTfar
			} forEach ((_loadout select 3) select 1);
		};
		if !((_loadout select 4) isEqualTo []) then {
			{
				_x call _fnc_replaceRadioTfar
			} forEach ((_loadout select 4) select 1);
		};
		if !((_loadout select 5) isEqualTo []) then {
			{
				_x call _fnc_replaceRadioTfar
			} forEach ((_loadout select 5) select 1);
		};
	};

	GVAR(character) set ["pos", getPosATL player];
	GVAR(character) set ["dir", getDir player];
	GVAR(character) set ["loadout", _loadout];

	GVAR(character) set ["engineer", player getVariable "ace_isengineer"];
	GVAR(character) set ["medic", player getVariable "ace_medical_medicclass"];
	GVAR(character) set ["explosive_specialist", player getUnitTrait "explosiveSpecialist"];

	GVAR(character) set ["aim_coef", getCustomAimCoef player];
	GVAR(character) set ["recoil_coef", unitRecoilCoefficient player];

	GVAR(character) set ["camouflage_coef", player getUnitTrait "camouflageCoef"];
	GVAR(character) set ["audible_coef", player getUnitTrait "audibleCoef"];

	private _data = GVAR(character) toArray	false;

	[_location, _data] call JAGER_state_fnc_save;
};

if (_uid != _local_uid) exitWith {
	[_uid] remoteExec [QFUNC(save), _uid call BIS_fnc_getUnitByUID];
};