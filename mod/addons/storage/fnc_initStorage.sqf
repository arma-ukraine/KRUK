#include "script_component.hpp"
TRACE_1("trace", nil);

params [
	"_object", // object
	"_tag", // str
	"_ops_location" // pos
];

removeAllActions _object;
_object allowDamage false;
_object disableAI "all";

if (isServer) then {
	_object setVariable [QGVAR(tag), _tag, true];
	_object setVariable [QGVAR(ops_location), _ops_location, true];
};

_object addAction ["Віддати на зберігання", FUNC(storeObject), [], 1, false, true, "", "_this distance _target < 3"];
_object addAction ["Отримати зі зберігання", FUNC(retrieveObject), [], 1, false, true, "", "_this distance _target < 3"];