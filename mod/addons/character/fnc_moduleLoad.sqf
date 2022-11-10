#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Zeus module: load character.
*/

params ["_logic"];

private _unit = attachedTo _logic;
deleteVehicle _logic;

if (isNull _unit) exitWith {
	systemChat "Оберіть юніта.";
};

if (!(_unit isKindOf "CAManBase")) exitWith {
	systemChat "Цей модуль працює лише з піхотою.";
};

if (!alive _unit) exitWith {
	systemChat "Юніт має бути живий.";
};

if (!isPlayer _unit) exitWith {
	systemChat "Цей модуль працює тільки на гравців.";
};

[getPlayerUID _unit] call FUNC(load);