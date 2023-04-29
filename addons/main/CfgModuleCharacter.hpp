#define MODULE moduleCharacter

class GVAR(MODULE) : Module_F
{
  displayName = QGVAR(MODULE);
  function = QFUNC(MODULE);
  init = QFUNC(MODULE);
  category = QGVAR(modules);
  scope = 2;        // EDEN: 1 - hide, 2 - show
  scopeCurator = 1; // ZEUS: 1 - hide, 2 - show

  isGlobal = 1; // 0 - server only, 1 - everywhere

  class Attributes : AttributesBase
  {
// Module-specific arguments:
#define MODULE_PROPERTY OwnerId
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Owner (Steam ID)";
      typeName = "STRING";
      defaultValue = "'default'";
    };
#define MODULE_PROPERTY CanDrive
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Can Drive";
      typeName = "STRING";
      defaultValue = "'Car,Motorcycle'";
    };
#define MODULE_PROPERTY CanTurret
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Can Man Turret";
      typeName = "STRING";
      defaultValue = "'Car,Motorcycle'";
    };
#define MODULE_PROPERTY AimCoef
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Aim Coefficient";
      typeName = "NUMBER";
      defaultValue = "50";
    };
#define MODULE_PROPERTY RecoilCoef
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Recoil Coefficient";
      typeName = "NUMBER";
      defaultValue = "50";
    };
#define MODULE_PROPERTY CamouflageCoef
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Camouflage Coefficient";
      typeName = "NUMBER";
      defaultValue = "2";
    };
#define MODULE_PROPERTY AudibleCoef
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Audible Coefficient";
      typeName = "NUMBER";
      defaultValue = "2";
    };
#define MODULE_PROPERTY ExplosiveSpecialist
    class MODULE_PROPERTY : Checkbox
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Explosives Specialist";
      typeName = "BOOL";
      defaultValue = "false";
    };
#define MODULE_PROPERTY Medic
    class MODULE_PROPERTY : Combo
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Medical Proficiency";
      typeName = "NUMBER";
      defaultValue = "0";
      class values
      {
        class None
        {
          name = "No";
          value = 0;
        };
        class Medic
        {
          name = "Medic";
          value = 1;
        };
        class Doctor
        {
          name = "Doctor";
          value = 2;
        };
      };
    };
#define MODULE_PROPERTY Engineer
    class MODULE_PROPERTY : Combo
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Engineering Proficiency";
      typeName = "NUMBER";
      defaultValue = "0";
      class values
      {
        class None
        {
          name = "No";
          value = 0;
        };
        class Medic
        {
          name = "Engineer";
          value = 1;
        };
        class Doctor
        {
          name = "Advanced Engineer";
          value = 2;
        };
      };
    };
  };

  // Module description (must inherit from base class, otherwise pre-defined entities won't be available):
  class ModuleDescription : ModuleDescription
  {
    description = "Predefined parameters for specific player.";
    sync[] = {"LocationArea_F"}; // Array of synced entities (can contain base classes)

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
