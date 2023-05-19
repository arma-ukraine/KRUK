#include "script_component.hpp"

class CfgPatches
{
  class ADDON
  {
    name = "KRUK Main";
    author = "DiRaven#0001";
    url = "https://discord.gg/DYA3dNS";

    requiredVersion = 2.10;
    requiredAddons[] = {"CBA_main", "afou_c_mig29"};
    units[] = {
        QGVAR(moduleAoeHint),
        QGVAR(moduleGradPersistenceSave),
        QGVAR(mig29sm_ars)};
    weapons[] = {};
  };
};

PRELOAD_ADDONS;

#include "CfgEventhandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgSounds.hpp"
