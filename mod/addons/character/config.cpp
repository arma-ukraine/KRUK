#include "script_component.hpp"

class CfgPatches
{
  class ADDON
  {
    name = COMPONENT_NAME;
    author = "DiRaven#0001";
    url = "https://discord.gg/DYA3dNS";

    requiredVersion = 2.10;
    requiredAddons[] = {"JAGER_main", "JAGER_state", "A3_Modules_F", "A3_Characters_F", "A3_Weapons_F", "CBA_main", "PY3_Pythia", "ACE_medical"};
    units[] = {
        QGVAR(moduleLoad),
        QGVAR(moduleSave)};
    weapons[] = {};
  };
};

PRELOAD_ADDONS;

#include "CfgEventhandlers.cpp"
#include "CfgDebriefing.cpp"
#include "CfgFactionClasses.cpp"
#include "CfgVehicles.cpp"
