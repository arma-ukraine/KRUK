class GVAR(Brash) : GVAR(Item)
{
  // picture = QPATHTOF(data\1hrn.paa); // TODO: pictures for all items
  scope = 2;
  displayName = "Хмиз";
  descriptionShort = "Кілька гілочок.";
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
  GVAR(value) = 30;
  class ItemInfo : InventoryItem_Base_F
  {
    mass = 20;
  };
  // Value per mass: 1.5
};