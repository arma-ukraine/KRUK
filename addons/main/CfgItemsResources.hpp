class GVAR(Brash) : GVAR(Item)
{
  scope = 2;
  displayName = "Хмиз";
  descriptionShort = "Кілька гілочок.";
  picture = QPATHTOF(data\wip.paa);
  GVAR(value) = 5;
  class ItemInfo : InventoryItem_Base_F
  {
    mass = 20;
  };
  // Value per mass: 0.25
};
class GVAR(IronScrap) : GVAR(Item)
{
  scope = 2;
  displayName = "Залізний металобрухт";
  descriptionShort = "Копійка гривню береже!";
  picture = QPATHTOF(data\wip.paa);
  GVAR(value) = 10;
  class ItemInfo : InventoryItem_Base_F
  {
    mass = 20;
  };
  // Value per mass: 0.5
};
class GVAR(SteelScrap) : GVAR(Item)
{
  scope = 2;
  displayName = "Сталевий металобрухт";
  descriptionShort = "Міцніше ніж залізо.";
  picture = QPATHTOF(data\wip.paa);
  GVAR(value) = 20;
  class ItemInfo : InventoryItem_Base_F
  {
    mass = 20;
  };
  // Value per mass: 1
};
class GVAR(CopperScrap) : GVAR(Item)
{
  scope = 2;
  displayName = "Мідний металобрухт";
  descriptionShort = "Блищить на сонці!";
  picture = QPATHTOF(data\wip.paa);
  GVAR(value) = 30;
  class ItemInfo : InventoryItem_Base_F
  {
    mass = 20;
  };
  // Value per mass: 1.5
};