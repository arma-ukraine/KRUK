#include "script_component.hpp"
TRACE_1("trace", nil);

// Client only.
if (!hasInterface) exitWith {};

GVAR(ColorCorrection) = ppEffectCreate ["colorCorrections", 1501];
GVAR(ColorCorrection) ppEffectAdjust
[
	1,
	1,
	0,
	[0, 0, 0, 0],
	[1, 1, 1, 0.6],
	[0.299, 0.587, 0.114, 0],
	[-1, -1, 0, 0, 0, 0, 0]
];
GVAR(ColorCorrection) ppEffectCommit 0;