#include "script_component.hpp"

class CfgPatches
{
  class JAGER_main
  {
    name = "Jager main addon";
    author = "DiRaven#0001";
    url = "https://discord.gg/DYA3dNS";

    requiredVersion = 2.10;
    requiredAddons[] = {"CBA_main"};
    units[] = {"JAGER_main_aoeHint"};
    weapons[] = {};
  };
};

PRELOAD_ADDONS;

#include "CfgEventhandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"
