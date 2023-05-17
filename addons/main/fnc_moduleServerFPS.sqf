#include "script_component.hpp"
TRACE_1("trace", nil);
/*
	Server FPS module - displays server fps.
	
	Source: github.com/KillahPotatoes/KP-Support/blob/master/kp_support_rhs.Altis/scripts/show_fps.sqf
	
	call FUNC(...);
*/
// Server only.
if (!isServer) exitWith {};
params ["_logic"];
private _pos = getPosASL _logic;
deleteVehicle _logic;

private ["_fpsMarker"];

_fpsMarker = createMarker ["fpsMarker", _pos];
_fpsMarker setMarkerType "mil_start";
_fpsMarker setMarkerSize [0.7, 0.7];

[_fpsMarker] spawn {
	params ["_fpsMarker"];

	while { true } do {
		private _fps = diag_fps;

		_fpsMarker setMarkerColor "ColorGREEN";
		if (_fps < 30) then {
			_fpsMarker setMarkerColor "ColorYELLOW";
		};
		if (_fps < 20) then {
			_fpsMarker setMarkerColor "ColorORANGE";
		};
		if (_fps < 10) then {
			_fpsMarker setMarkerColor "ColorRED";
		};

		_fpsMarker setMarkerText format ["Server: %1 fps and %2 ground units", (round (_fps * 100.0)) / 100.0, {
			!(isPlayer _x) && (alive _x) && ((vehicle _x) isKindOf "Land") && !(isObjectHidden _x)
		} count allUnits];

		sleep 15;
	};
};