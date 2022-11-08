#include "script_component.hpp"

class CfgPatches
{
  class ADDON
  {
    name = COMPONENT_NAME;
    author = "DiRaven#0001";
    url = "https://discord.gg/DYA3dNS";

    requiredVersion = 2.10;
    requiredAddons[] = {"CBA_main", "PY3_Pythia"};
    units[] = {};
    weapons[] = {};
  };
};

PRELOAD_ADDONS;

#include "CfgEventhandlers.cpp"
