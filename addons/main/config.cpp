#include "script_component.hpp"

class CfgPatches
{
  class ADDON
  {
    name = "Jager Main";
    author = "DiRaven#0001";
    url = "https://discord.gg/DYA3dNS";

    requiredVersion = 2.10;
    requiredAddons[] = {"CBA_main"};
    units[] = {
        QGVAR(moduleAoeHint),
        QGVAR(moduleGradPersistenceSave)};
    weapons[] = {};
  };
};

PRELOAD_ADDONS;

#include "CfgEventhandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
