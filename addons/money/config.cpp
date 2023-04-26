#include "script_component.hpp"

class CfgPatches
{
  class ADDON
  {
    name = "Jager Money";
    author = "DiRaven#0001";
    url = "https://discord.gg/DYA3dNS";

    requiredVersion = 2.10;
    requiredAddons[] = {"CBA_main", "JAGER_main"};
    units[] = {};
    weapons[] = {};
  };
};

PRELOAD_ADDONS;

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
