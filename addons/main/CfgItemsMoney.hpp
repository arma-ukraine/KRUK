class GVAR(Uah) : ItemCore
{
  scope = 1;
  displayName = "-";
  detectRange = -1;
  simulation = "ItemMineDetector";
  useAsBinocular = 0;
  type = 4096;
  picture = "";
  descriptionShort = "";
  GVAR(value) = 0;
  class ItemInfo : InventoryItem_Base_F
  {
    mass = 0.01;
  };
};
class GVAR(Uah_1) : GVAR(Uah)
{
  scope = 2;
  displayName = "Банкнота 1 грн";
  picture = QPATHTOF(data\1hrn.paa);
  descriptionShort = "Банкнота номіналом 1 гривня.";
  GVAR(value) = 1;
};
class GVAR(Uah_2) : GVAR(Uah)
{
  scope = 2;
  displayName = "Банкнота 2 грн";
  picture = QPATHTOF(data\2hrn.paa);
  descriptionShort = "Банкнота номіналом 2 гривні.";
  GVAR(value) = 2;
};
class GVAR(Uah_5) : GVAR(Uah)
{
  scope = 2;
  displayName = "Банкнота 5 грн";
  picture = QPATHTOF(data\5hrn.paa);
  descriptionShort = "Банкнота номіналом 5 гривень.";
  GVAR(value) = 5;
};
class GVAR(Uah_10) : GVAR(Uah)
{
  scope = 2;
  displayName = "Банкнота 10 грн";
  picture = QPATHTOF(data\10hrn.paa);
  descriptionShort = "Банкнота номіналом 10 гривень.";
  GVAR(value) = 10;
};
class GVAR(Uah_20) : GVAR(Uah)
{
  scope = 2;
  displayName = "Банкнота 20 грн";
  picture = QPATHTOF(data\20hrn.paa);
  descriptionShort = "Банкнота номіналом 20 гривень.";
  GVAR(value) = 20;
};
class GVAR(Uah_50) : GVAR(Uah)
{
  scope = 2;
  displayName = "Банкнота 50 грн";
  picture = QPATHTOF(data\50hrn.paa);
  descriptionShort = "Банкнота номіналом 50 гривень.";
  GVAR(value) = 50;
};
class GVAR(Uah_100) : GVAR(Uah)
{
  scope = 2;
  displayName = "Банкнота 100 грн";
  picture = QPATHTOF(data\100hrn.paa);
  descriptionShort = "Банкнота номіналом 100 гривень.";
  GVAR(value) = 100;
};
class GVAR(Uah_200) : GVAR(Uah)
{
  scope = 2;
  displayName = "Банкнота 200 грн";
  picture = QPATHTOF(data\200hrn.paa);
  descriptionShort = "Банкнота номіналом 200 гривень.";
  GVAR(value) = 200;
};
class GVAR(Uah_500) : GVAR(Uah)
{
  scope = 2;
  displayName = "Банкнота 500 грн";
  picture = QPATHTOF(data\500hrn.paa);
  descriptionShort = "Банкнота номіналом 500 гривень.";
  GVAR(value) = 500;
};