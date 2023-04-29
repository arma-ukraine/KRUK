class CfgVehicles
{
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

    // Actual modules.
    class GVAR(moduleAoeHint) : Module_F
    {
        displayName = QGVAR(moduleAoeHint);
        function = QFUNC(moduleAoeHint);
        category = QGVAR(modules);
        curatorCanAttach = 0;
        scope = 1;
        scopeCurator = 2;
    };
    class GVAR(moduleBodyLoot) : Module_F
    {
        displayName = QGVAR(moduleBodyLoot);
        function = QFUNC(moduleBodyLoot);
        category = QGVAR(modules);
        curatorCanAttach = 0;
        scope = 2;
        scopeCurator = 1;
    };
    class GVAR(moduleColorCorrection) : Module_F
    {
        displayName = QGVAR(moduleColorCorrection);
        function = QFUNC(moduleColorCorrection);
        category = QGVAR(modules);
        curatorCanAttach = 0;
        scope = 2;
        scopeCurator = 1;
    };
    class GVAR(moduleEditorDynamicSimulation) : Module_F
    {
        displayName = QGVAR(moduleEditorDynamicSimulation);
        function = QFUNC(moduleEditorDynamicSimulation);
        category = QGVAR(modules);
        curatorCanAttach = 0;
        scope = 2;
        scopeCurator = 1;
    };
    class GVAR(moduleFuelConsumption) : Module_F
    {
        displayName = QGVAR(moduleFuelConsumption);
        function = QFUNC(moduleFuelConsumption);
        category = QGVAR(modules);
        curatorCanAttach = 0;
        scope = 2;
        scopeCurator = 1;
    };
    class GVAR(moduleUnarmed) : Module_F
    {
        displayName = QGVAR(moduleUnarmed);
        function = QFUNC(moduleUnarmed);
        category = QGVAR(modules);
        curatorCanAttach = 0;
        scope = 2;
        scopeCurator = 1;
    };

#include "CfgModuleCharacter.hpp"
#include "CfgModuleSpawner.hpp"
#include "CfgModuleBuyer.hpp"
};
