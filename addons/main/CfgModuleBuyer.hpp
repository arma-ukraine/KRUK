#define MODULE moduleBuyer

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
#define MODULE_PROPERTY BuyPriceMultiplier
    class MODULE_PROPERTY : Edit
    {
      property = QGVAR(DOUBLES(MODULE, MODULE_PROPERTY));
      displayName = "Buy Price Multiplier";
      typeName = "NUMBER";
      defaultValue = "0.8";
    };
    class ModuleDescription : ModuleDescription
    {
    }; // Module description should be shown last.
  };

  // Module description (must inherit from base class, otherwise pre-defined entities won't be available):
  class ModuleDescription : ModuleDescription
  {
    description = "Create a box, put some items in there, sync to module.<br>Once in-game - there will be a buy action that will replace items placed by players with money. Items must have JAGER_main_value property in order to be registered for purchase.";
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