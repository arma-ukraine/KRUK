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
    class GVAR(moduleSpawner) : Module_F
    {
        displayName = QGVAR(moduleSpawner);
        function = QFUNC(moduleSpawner);
        init = QFUNC(moduleSpawner);
        category = QGVAR(modules);
        scope = 2;        // EDEN: 1 - hide, 2 - show
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
                property = QGVAR(moduleSpawnerMinGroupSize);
                displayName = "Units: min per group";
                typeName = "NUMBER";
                defaultValue = "3";
            };
            class MaxGroupSize : Edit
            {
                property = QGVAR(moduleSpawnerMaxGroupSize);
                displayName = "Units: max per group";
                typeName = "NUMBER";
                defaultValue = "5";
            };
            class MinGroups : Edit
            {
                property = QGVAR(moduleSpawnerMinGroups);
                displayName = "Units: min groups";
                typeName = "NUMBER";
                defaultValue = "1";
            };
            class MaxGroups : Edit
            {
                property = QGVAR(moduleSpawnerMaxGroups);
                displayName = "Units: max groups";
                typeName = "NUMBER";
                defaultValue = "3";
            };
            class UnitsSide : Combo
            {
                property = QGVAR(moduleSpawnerUnitsSide);
                displayName = "Units: side";
                typeName = "STRING";
                defaultValue = "'blufor'";
                class Values
                {
                    class BLUFOR
                    {
                        name = "BLUFOR";
                        value = "blufor";
                    };
                    class OPFOR
                    {
                        name = "OPFOR";
                        value = "opfor";
                    };
                    class INDEPENDENT
                    {
                        name = "INDEPENDENT";
                        value = "independent";
                    };
                    class CIVILIAN
                    {
                        name = "CIVILIAN";
                        value = "civilian";
                    };
                };
            };
            class UnitsClasses : Edit
            {
                property = QGVAR(moduleSpawnerUnitsClasses);
                displayName = "Units";
                typeName = "STRING";
                defaultValue = "'B_Soldier_F,B_RangeMaster_F'";
            };

            class ItemsClasses : Edit
            {
                property = QGVAR(moduleSpawnerItemsClasses);
                displayName = "Items";
                typeName = "STRING";
                defaultValue = "'1-3*ItemMap,1-20*ItemWatch'";
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
            sync[] = {"LocationArea_F"};                                                                                                                                                                         // Array of synced entities (can contain base classes)

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
