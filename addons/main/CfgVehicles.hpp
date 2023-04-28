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
    class GVAR(moduleCharacters) : Module_F
    {
        displayName = QGVAR(moduleCharacters);
        function = QFUNC(moduleCharacters);
        category = QGVAR(modules);
    };
    class GVAR(moduleUnitSpawner) : Module_F
    {
        displayName = QGVAR(moduleUnitSpawner);
        function = QFUNC(moduleUnitSpawner);
        init = QFUNC(moduleUnitSpawner);
        category = QGVAR(modules);
        scope = 2; // EDEN: 1 - hide, 2 - show
        scopeCurator = 1; // ZEUS: 1 - hide, 2 - show

        isGlobal = 0;           // 0 - server only, 1 - everywhere
        isTriggerActivated = 0; // 0 - activates once, 1 - requires trigger activation
        canSetArea = 1;         // 0 - does not specify area, 1 - specifies area

        class Attributes : AttributesBase
        {
            // Module-specific arguments:
            class SpawnActivationDistance : Edit
            {
                property = QGVAR(moduleSpawnActivationDistance);
                displayName = "Spawn trigger extra distance";
                typeName = "NUMBER";
                defaultValue = "500";
            };
            class MinGroupSize : Edit
            {
                property = QGVAR(moduleUnitSpawnerMinGroupSize);
                displayName = "Minimum units per group";
                typeName = "NUMBER";
                defaultValue = "3";
            };
            class MaxGroupSize : Edit
            {
                property = QGVAR(moduleUnitSpawnerMaxGroupSize);
                displayName = "Maximum units per group";
                typeName = "NUMBER";
                defaultValue = "5";
            };
            class MinGroups : Edit
            {
                property = QGVAR(moduleUnitSpawnerMinGroups);
                displayName = "Maximum groups";
                typeName = "NUMBER";
                defaultValue = "1";
            };
            class MaxGroups : Edit
            {
                property = QGVAR(moduleUnitSpawnerMaxGroups);
                displayName = "Minimum groups";
                typeName = "NUMBER";
                defaultValue = "3";
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
            description = "Will spawn synced units in the area once any player comes closer then module edge + spawn trigger extra distance. Will despawn units once player leaves the area. DO NOT mix sides!"; // Short description, will be formatted as structured text
            sync[] = {"LocationArea_F"};              // Array of synced entities (can contain base classes)

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
};
