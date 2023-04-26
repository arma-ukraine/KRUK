#include "script_component.hpp"

class CfgPatches
{
  class ADDON
  {
    name = "Jager Factions";
    author = "DiRaven#0001";
    url = "https://discord.gg/DYA3dNS";

    requiredVersion = 2.10;
    requiredAddons[] = {"CBA_main", "WBK_MeleeMechanics", "JAGER_main", "JAGER_money"};
    units[] = {
        QGVAR(Mrazota_Melee_Fists),
        QGVAR(Mrazota_Melee_Fists_Rusher),
        QGVAR(Mrazota_Melee_Weapon),
        QGVAR(Mrazota_Melee_Weapon_Rusher),
        QGVAR(Mrazota_Firearms_Handgun)};
    // QGVAR(Mutants_Blind_Dog_Grey),
    // QGVAR(Mutants_Blind_Dog_Brown),
    // QGVAR(Mutants_Blind_Dog_White)};
    weapons[] = {};
  };
};

PRELOAD_ADDONS;

#include "CfgEventHandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"