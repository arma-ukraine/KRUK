class cfgWeapons
{
  class ItemCore;
  class InventoryItem_Base_F;
  class Uah : ItemCore
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
      mass = 1;
    };
  };
  class Uah_1 : Uah
  {
    scope = 2;
    displayName = "Банкнота 1 грн";
    picture = QPATHTOF(data\1hrn.paa);
    descriptionShort = "Банкнота номіналом 1 гривня.";
    value = 1;
    class ItemInfo : ItemInfo
    {
      mass = 0;
    };
  };
  class Uah_2 : Uah
  {
    scope = 2;
    displayName = "Банкнота 2 грн";
    picture = QPATHTOF(data\2hrn.paa);
    descriptionShort = "Банкнота номіналом 2 гривні.";
    value = 2;
    class ItemInfo : ItemInfo
    {
      mass = 0;
    };
  };
  class Uah_5 : Uah
  {
    scope = 2;
    displayName = "Банкнота 5 грн";
    picture = QPATHTOF(data\5hrn.paa);
    descriptionShort = "Банкнота номіналом 5 гривень.";
    value = 5;
    class ItemInfo : ItemInfo
    {
      mass = 0;
    };
  };
  class Uah_10 : Uah
  {
    scope = 2;
    displayName = "Банкнота 10 грн";
    picture = QPATHTOF(data\10hrn.paa);
    descriptionShort = "Банкнота номіналом 10 гривень.";
    value = 10;
    class ItemInfo : ItemInfo
    {
      mass = 0;
    };
  };
  class Uah_20 : Uah
  {
    scope = 2;
    displayName = "Банкнота 20 грн";
    picture = QPATHTOF(data\20hrn.paa);
    descriptionShort = "Банкнота номіналом 20 гривень.";
    value = 20;
    class ItemInfo : ItemInfo
    {
      mass = 0;
    };
  };
  class Uah_50 : Uah
  {
    scope = 2;
    displayName = "Банкнота 50 грн";
    picture = QPATHTOF(data\50hrn.paa);
    descriptionShort = "Банкнота номіналом 50 гривень.";
    value = 50;
    class ItemInfo : ItemInfo
    {
      mass = 0;
    };
  };
  class Uah_100 : Uah
  {
    scope = 2;
    displayName = "Банкнота 100 грн";
    picture = QPATHTOF(data\100hrn.paa);
    descriptionShort = "Банкнота номіналом 100 гривень.";
    value = 100;
    class ItemInfo : ItemInfo
    {
      mass = 0;
    };
  };
  class Uah_200 : Uah
  {
    scope = 2;
    displayName = "Банкнота 200 грн";
    picture = QPATHTOF(data\200hrn.paa);
    descriptionShort = "Банкнота номіналом 200 гривень.";
    value = 200;
    class ItemInfo : ItemInfo
    {
      mass = 0;
    };
  };
  class Uah_500 : Uah
  {
    scope = 2;
    displayName = "Банкнота 500 грн";
    picture = QPATHTOF(data\500hrn.paa);
    descriptionShort = "Банкнота номіналом 500 гривень.";
    value = 500;
    class ItemInfo : ItemInfo
    {
      mass = 0;
    };
  };
};
