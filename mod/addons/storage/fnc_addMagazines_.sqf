#include "script_component.hpp"
TRACE_1("trace", nil);

systemChat str _magazineData;

params ["_magazineData", "_container"];
{
	_container addMagazineAmmoCargo [_x#0, 1, _x#1];
} forEach _magazineData;