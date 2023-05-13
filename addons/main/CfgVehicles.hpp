class SensorTemplateAntiRadiation;
// Vehicle overrides.
class b_afougf_mig29sm
{
    class Components
    {
        class SensorsManagerComponent
        {
            class Components;
        };
    };
};

class CfgVehicles
{
    class b_afougf_mig29sm_ars : b_afougf_mig29sm
    {
        displayName = "Mig-29CM-ARS";

        class Components : Components
        {
            class SensorsManagerComponent : SensorsManagerComponent
            {
                class Components : Components
                {
                    class AntiRadiationSensorComponent : SensorTemplateAntiRadiation
                    {
                        class AirTarget
                        {
                            minRange = 16000;
                            maxRange = 16000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                        class GroundTarget
                        {
                            minRange = 16000;
                            maxRange = 16000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                        maxTrackableATL = 100;
                        maxTrackableSpeed = 60;
                        angleRangeHorizontal = 60;
                        angleRangeVertical = 180;
                    };
                };
            };
        };
    };

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
        scope = 1;
        scopeCurator = 2;
    };
    class GVAR(moduleBodyLoot) : Module_F
    {
        displayName = QGVAR(moduleBodyLoot);
        function = QFUNC(moduleBodyLoot);
        category = QGVAR(modules);
        scope = 2;
        scopeCurator = 1;
    };
    class GVAR(moduleColorCorrection) : Module_F
    {
        displayName = QGVAR(moduleColorCorrection);
        function = QFUNC(moduleColorCorrection);
        category = QGVAR(modules);
        scope = 2;
        scopeCurator = 1;
    };
    class GVAR(moduleEditorDynamicSimulation) : Module_F
    {
        displayName = QGVAR(moduleEditorDynamicSimulation);
        function = QFUNC(moduleEditorDynamicSimulation);
        category = QGVAR(modules);
        scope = 2;
        scopeCurator = 1;
    };
    class GVAR(moduleFuelConsumption) : Module_F
    {
        displayName = QGVAR(moduleFuelConsumption);
        function = QFUNC(moduleFuelConsumption);
        category = QGVAR(modules);
        scope = 2;
        scopeCurator = 1;
    };
    class GVAR(moduleUnarmed) : Module_F
    {
        displayName = QGVAR(moduleUnarmed);
        function = QFUNC(moduleUnarmed);
        category = QGVAR(modules);
        scope = 2;
        scopeCurator = 1;
    };

    class GVAR(moduleGradPersistenceAutosave) : Module_F
    {
        displayName = QGVAR(moduleGradPersistenceAutosave);
        function = QFUNC(moduleGradPersistenceAutosave);
        category = QGVAR(modules);
        scope = 2;
        scopeCurator = 1;
        isGlobal = 0; // run on server
    };
    class GVAR(moduleGradPersistenceSave) : Module_F
    {
        displayName = QGVAR(moduleGradPersistenceSave);
        function = QFUNC(moduleGradPersistenceSave);
        category = QGVAR(modules);
        curatorInfoType = QGVAR(RscDefendArea);
        scope = 1;
        scopeCurator = 2;
    };
#define MODULE moduleHungryThirstyEffects
    class GVAR(MODULE) : Module_F
    {
        displayName = QGVAR(MODULE);
        function = QFUNC(MODULE);
        category = QGVAR(modules);
        scope = 2;        // EDEN: 1 - hide, 2 - show
        scopeCurator = 1; // ZEUS: 1 - hide, 2 - show
    };

#include "CfgModuleCharacter.hpp"
#include "CfgModuleSpawner.hpp"
#include "CfgModuleBuyer.hpp"
};
