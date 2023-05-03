class GVAR(Trash) : GVAR(Item)
{
  scope = 2;
  displayName = "Сміття";
  descriptionShort = "Нашо воно тобі?";
  picture = QPATHTOF(data\textures\wip.paa);
  GVAR(value) = 5;
  class ItemInfo : InventoryItem_Base_F
  {
    mass = 20;
  };
  // Value per mass: 0.25
};
class GVAR(AnomalousWood) : GVAR(Item)
{
  scope = 2;
  displayName = "Аномальна Деревина";
  descriptionShort = "Тепленька на дотик.";
  picture = QPATHTOF(data\textures\wip.paa);
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
  displayName = "Брухт: Залізо";
  descriptionShort = "Копійка гривню береже!";
  picture = QPATHTOF(data\textures\wip.paa);
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
  displayName = "Брухт: Сталь";
  descriptionShort = "Міцніше ніж залізо.";
  picture = QPATHTOF(data\textures\wip.paa);
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
  displayName = "Брухт: Мідь";
  descriptionShort = "Блищить на сонці!";
  picture = QPATHTOF(data\textures\wip.paa);
  GVAR(value) = 30;
  class ItemInfo : InventoryItem_Base_F
  {
    mass = 20;
  };
  // Value per mass: 1.5
};