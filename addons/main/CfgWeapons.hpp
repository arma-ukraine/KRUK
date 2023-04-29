class cfgWeapons
{
  class ItemCore;
  class InventoryItem_Base_F;
  class GVAR(Item) : ItemCore
  {
    scope = 1;
    displayName = "-";
    detectRange = -1;
    simulation = "ItemMineDetector";
    useAsBinocular = 0;
    type = 4096;
    picture = "";
    descriptionShort = "";
    value = 0;
    class ItemInfo : InventoryItem_Base_F
    {
      mass = 0.01;
    };
  };

#include "CfgItemsMoney.hpp"
#include "CfgItemsResources.hpp"
};
