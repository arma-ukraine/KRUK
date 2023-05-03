#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Initialize color correction on client.
	
	call FUNC(...);
*/

// Client only.
systemChat "color correction";
if (!hasInterface) exitWith {};
waitUntil {
	!isNull player
};
// Create effect.
GVAR(ColorCorrection) = ppEffectCreate ["colorCorrections", 1501];

// Adjust effect.
GVAR(ColorCorrection) ppEffectAdjust
[1, 0.9, -0.002, [0.0, 0.0, 0.0, 0.0], [1.0, 0.6, 0.4, 0.6], [0.199, 0.587, 0.114, 0.0]];

// apply effect.
GVAR(ColorCorrection) ppEffectCommit 0;