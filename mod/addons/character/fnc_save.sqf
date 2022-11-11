#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Save character.
	
	[_player_uid, _unit] call FUNC(...);
	
	_player_uid - obvious.
	_unit - sometimes it's not possible to get unit by player uid any more, 
	e.g. when player disconnects. When that happens we pass unit over directly.
*/

params ["_uid", "_unit"];

// Server only. Redirect to server if function executed elsewhere.
if (!isServer) exitWith {
	_uid remoteExec [QFUNC(save), 2];
};

// Get unit we'll be saving if not provided.
if (isNil "_unit") then {
	_unit = _uid call BIS_fnc_getUnitByUID;
};

// Generate location we'll save data at.
private _location = format ["%1/character", _uid];

// get state that was attached to unit.
private _state = _unit getVariable QGVAR(state);

// get unit loadout.
private _loadout = (getUnitLoadout _unit) call FUNC(fixLoadoutMagazines);

// Deinstance tfar radios in loadout, make them of generic class.
if (GVARMAIN(tfarLoaded)) then {
	if (count (_loadout select 9) > 0) then {
		private _assignedRadio = (_loadout select 9) select 2;
		if (_assignedRadio call TFAR_fnc_isRadio) then {
			(_loadout select 9) set [2, [configFile >> "CfgWeapons" >> _assignedRadio >> "tf_parent", "text", _assignedRadio] call CBA_fnc_getConfigEntry];
		};
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

// set other variables from actual character state.
_state set ["pos", getPosATL _unit];
_state set ["dir", getDir _unit];
_state set ["loadout", _loadout];

_state set ["engineer", _unit getVariable "ace_isengineer"];
_state set ["medic", _unit getVariable "ace_medical_medicclass"];
_state set ["explosive_specialist", _unit getUnitTrait "explosiveSpecialist"];

// Convert our state to array for it to be saved.
private _data = _state toArray false;

// Save character data.
[_location, _data] remoteExec ["JAGER_state_fnc_save", 2]