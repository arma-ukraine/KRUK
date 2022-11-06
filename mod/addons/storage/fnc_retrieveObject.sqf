#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_target", "_caller", "_actionId", "_classname"];

private _tag = _target getVariable QGVAR(tag);
private _ops_location = _target getVariable QGVAR(ops_location);

// Make sure ops location is empty.
private _obj = nearestObjects [_ops_location, ["ReammoBox_F"], 5] # 0;
if (!(isNil "_obj")) exitWith {
	systemChat "Місце вже зайняте, приберіть зайве.";
};

// Retrieve item.
private _location = format ["%1/storage_%2", getPlayerUID player, _tag];
[_location, QFUNC(initObject), [], [_ops_location]] call JAGER_main_fnc_loadState;

// Ask server to save empty value instead.
[_location, []] call JAGER_main_fnc_saveState;