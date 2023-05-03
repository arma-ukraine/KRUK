#define MODULE moduleSpawner

class GVAR(MODULE) : Module_F
{
  displayName = QGVAR(MODULE);
  function = QFUNC(MODULE);
  category = QGVAR(modules);
  scope = 2;        // EDEN: 1 - hide, 2 - show
  scopeCurator = 1; // ZEUS: 1 - hide, 2 - show

  isGlobal = 0;   // 0 - server only, 1 - everywhere
  canSetArea = 1; // 0 - does not specify area, 1 - specifies area

  class Attributes : AttributesBase
  {
    // Module-specific arguments:
#define MODULE_PROPERTY SpawnActivationDistance
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Spawn trigger extra distance";
      typeName = "NUMBER";
      defaultValue = "250";
    };
#define MODULE_PROPERTY BuildingsPercentage
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Spawn in buildings (1 = 100%)";
      typeName = "NUMBER";
      defaultValue = "0.5";
    };
#define MODULE_PROPERTY Cooldown
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Spawner cooldown (seconds)";
      typeName = "NUMBER";
      defaultValue = "600";
    };
#define MODULE_PROPERTY MaxDeviation
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Max density deviation";
      typeName = "NUMBER";
      defaultValue = "0.3";
    };
#define MODULE_PROPERTY UnitDensity
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Units per m2";
      typeName = "NUMBER";
      defaultValue = "0.006";
    };
#define MODULE_PROPERTY LootDensity
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Loot per m2";
      typeName = "NUMBER";
      defaultValue = "0.006";
    };
#define MODULE_PROPERTY AnomalyDensity
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Anomalies per m2";
      typeName = "NUMBER";
      defaultValue = "0.006";
    };
#define MODULE_PROPERTY AnomaliesBurner
    class MODULE_PROPERTY : Checkbox
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Burner anomalies";
      typeName = "BOOL";
      defaultValue = "false";
    };
#define MODULE_PROPERTY AnomaliesElectra
    class MODULE_PROPERTY : Checkbox
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Electra anomalies";
      typeName = "BOOL";
      defaultValue = "false";
    };
#define MODULE_PROPERTY AnomaliesFog
    class MODULE_PROPERTY : Checkbox
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Fog anomalies";
      typeName = "BOOL";
      defaultValue = "false";
    };
#define MODULE_PROPERTY AnomaliesFruitPunch
    class MODULE_PROPERTY : Checkbox
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Fruit Punch anomalies";
      typeName = "BOOL";
      defaultValue = "false";
    };
#define MODULE_PROPERTY AnomaliesMeatgrinder
    class MODULE_PROPERTY : Checkbox
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Meatgrinder anomalies";
      typeName = "BOOL";
      defaultValue = "false";
    };
#define MODULE_PROPERTY AnomaliesSpringboard
    class MODULE_PROPERTY : Checkbox
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Springboard anomalies";
      typeName = "BOOL";
      defaultValue = "false";
    };

    class ModuleDescription : ModuleDescription
    {
    }; // Module description should be shown last.
  };
  class AttributeValues
  {
    size3[] = {50, 50, -1}; // Default area size.
  };

  // Module description (must inherit from base class, otherwise pre-defined entities won't be available):
  class ModuleDescription : ModuleDescription
  {
    description = "Spawns synced groups and items in the area once any player comes closer then module edge + spawn trigger extra distance. Each group must be synced exactly once. Despawns groups and items once player leaves the area."; // Short description, will be formatted as structured text
    sync[] = {"LocationArea_F"};                                                                                                                                                                                                             // Array of synced entities (can contain base classes)

    class LocationArea_F
    {
      description[] = {// Multi-line descriptions are supported
                       "First line",
                       "Second line"};
      position = 1;            // Position is taken into effect
      direction = 1;           // Direction is taken into effect
      optional = 1;            // Synced entity is optional
      duplicate = 1;           // Multiple entities of this type can be synced
      synced[] = {"AnyBrain"}; // Pre-defined entities like "AnyBrain" can be used (see the table below)
      sync[] = {"TriggerArea"};
    };
  };
};