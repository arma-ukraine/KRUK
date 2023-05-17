#define MODULE(NAME, EDEN, ZEUS) \
  class GVAR(NAME) : Module_F    \
  {                              \
    displayName = QGVAR(NAME);   \
    function = QFUNC(NAME);      \
    category = QGVAR(modules);   \
    scope = EDEN;                \
    scopeCurator = ZEUS;         \
  };
#define MODULE_EDEN(NAME) MODULE(NAME, 2, 1)
#define MODULE_ZEUS(NAME) MODULE(NAME, 1, 2)
#define MODULE_BOTH(NAME) MODULE(NAME, 2, 2)

// Base module classes.
class Logic;
class Module_F : Logic
{
  class AttributesBase
  {
    class Default;
    class Edit;              // Default edit box (i.e. text input field)
    class Combo;             // Default combo box (i.e. drop-down menu)
    class Checkbox;          // Default checkbox (returned value is Boolean)
    class CheckboxNumber;    // Default checkbox (returned value is Number)
    class ModuleDescription; // Module description
    class Units;             // Selection of units on which the module is applied
  };

  // Description base classes (for more information see below):
  class ModuleDescription
  {
    class AnyBrain;
  };
};

MODULE_EDEN(moduleHungryThirstyEffects)
MODULE_EDEN(moduleServerFPS)
MODULE_EDEN(moduleGradPersistenceAutosave)
MODULE_EDEN(moduleUnarmed)
MODULE_EDEN(moduleFuelConsumption)
MODULE_EDEN(moduleEditorDynamicSimulation)
MODULE_EDEN(moduleColorCorrection)
MODULE_EDEN(moduleBodyLoot)

MODULE_ZEUS(moduleGradPersistenceSave)
MODULE_ZEUS(moduleAoeHint)

#include "CfgModuleCharacter.hpp"
#include "CfgModuleSpawner.hpp"
#include "CfgModuleBuyer.hpp"