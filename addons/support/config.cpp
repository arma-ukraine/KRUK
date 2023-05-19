#include "script_component.hpp"

class CfgPatches
{
  class ADDON
  {
    name = "KRUK Support";
    author = "DiRaven#0001";
    url = "https://discord.gg/DYA3dNS";

    requiredVersion = 2.10;
    requiredAddons[] = {"CBA_main"};
    units[] = {};
    weapons[] = {};
  };
};

class CfgFunctions
{
  class A3_Missions_F_Heli
  {
    tag = "BIS";
    project = "arma3";
    class MissionTypes
    {
      class ModuleMPTypeGroundSupport
      {
        file = QPATHTOF(overrides\a3\missions_f_heli\mptypes\groundsupport\init.sqf);
      };
      class ModuleMPTypeGroundSupportBase
      {
        file = QPATHTOF(overrides\a3\missions_f_heli\mptypes\groundsupportbase\init.sqf);
      };
    };
  };
};
