#include "script_component.hpp"

class CfgPatches
{
  class ADDON
  {
    name = COMPONENT_NAME;
    author = "DiRaven#0001";
    url = "https://discord.gg/DYA3dNS";

    requiredVersion = 2.10;
    requiredAddons[] = {"A3_Characters_F", "CBA_main", "WBK_MeleeMechanics", "JAGER_main", "JAGER_money"};
    units[] = {
        QGVAR(Mrazota_Melee_Fists),
        QGVAR(Mrazota_Melee_Fists_Rusher),
        QGVAR(Mrazota_Melee_Weapon),
        QGVAR(Mrazota_Melee_Weapon_Rusher),
        QGVAR(Mrazota_Firearms_Handgun)};
    weapons[] = {};
  };
};

PRELOAD_ADDONS;

#include "CfgEventhandlers.cpp"
#include "CfgFactions.cpp"