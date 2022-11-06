#include "script_component.hpp"
TRACE_1("trace", nil);

params ["_vehicle", "_inventoryData"];
_inventoryData params ["_itemData", "_weaponData", "_magazineData", "_backpackData"];

clearItemCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

[_itemData, _vehicle] call FUNC(addItems);
[_weaponData, _vehicle] call FUNC(addWeaponItems);
[_magazineData, _vehicle] call FUNC(addMagazines_);
[_backpackData, _vehicle] call FUNC(addBackpacks);