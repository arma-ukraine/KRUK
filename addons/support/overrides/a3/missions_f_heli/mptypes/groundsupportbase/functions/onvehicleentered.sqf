/*
	vehicle: Object - vehicle the event handler is assigned to
	position: String - Can be either "driver", "gunner", "commander" or "cargo"
	unit: Object - Unit that entered the vehicle
*/

private["_vehicle", "_position", "_unit", "_crewGroup"];

_vehicle = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_position = [_this, 1, "", [""]] call BIS_fnc_param;
_unit = [_this, 2, objNull, [objNull]] call BIS_fnc_param;

if (isNull _vehicle || isNull _unit || _position == "") exitWith {
	["[x][%1|%2|%3] Event script 'GetIn' failed!", _vehicle, _position, _unit] call BIS_fnc_error;
};

if !(isPlayer _unit) exitWith {};

// a player is entering vehicle occupied by another player
private["_anotherPlayer"];
_anotherPlayer = false;
{
	if (isPlayer _x) exitWith {
		_anotherPlayer = true
	};
}
forEach ((crew _vehicle) - [_unit]);

// automated group management if there are no other players
if (!_anotherPlayer) then {
	// join in the crew group
	private _prevGroup = group _unit;
	_crewGroup = _vehicle getVariable ["bis_crewGroup", grpNull];
	[_unit] joinSilent _crewGroup;
	_unit assignAsDriver _vehicle;
	deleteGroup _prevGroup;

	[[[_crewGroup, _unit],
		{
			(_this select 0) selectLeader (_this select 1);
		}
	], "bis_fnc_call", leader _crewGroup] call BIS_fnc_MP;
};