class CfgVehicles
{
    // Base module class.
    class Module_F;

    // Base JAGER modules.
    class JAGER_main_moduleBase : Module_F
    {
        author = "DiRaven#0001";
        category = "NO_CATEGORY";
        function = "";
        curatorCanAttach = 0;
    };
    class JAGER_main_moduleBaseEden : JAGER_main_moduleBase
    {
        scope = 2;
        scopeCurator = 1;
    };
    class JAGER_main_moduleBaseZeus : JAGER_main_moduleBase
    {
        scope = 1;
        scopeCurator = 2;
    };
    class JAGER_main_moduleBaseBoth : JAGER_main_moduleBase
    {
        scope = 2;
        scopeCurator = 2;
    };

    // Actual modules.
    class JAGER_main_moduleAoeHint : JAGER_main_moduleBaseZeus
    {
        category = "JAGER_main_modules";
        displayName = "AOE Hint";
        function = "JAGER_main_fnc_moduleAoeHint";
    };
    class JAGER_main_moduleBodyLoot : JAGER_main_moduleBaseEden
    {
        category = "JAGER_main_modules";
        displayName = "Body Loot";
        function = "JAGER_main_fnc_moduleBodyLoot";
    };
    class JAGER_main_moduleColorCorrection : JAGER_main_moduleBaseEden
    {
        category = "JAGER_main_modules";
        displayName = "Color Correction";
        function = "JAGER_main_fnc_moduleColorCorrection";
    };
    class JAGER_main_moduleEditorDynamicSimulation : JAGER_main_moduleBaseEden
    {
        category = "JAGER_main_modules";
        displayName = "All Eden Units Dynamic Simulation";
        function = "JAGER_main_fnc_moduleEditorDynamicSimulation";
    };
    class JAGER_main_moduleFuelConsumption : JAGER_main_moduleBaseEden
    {
        category = "JAGER_main_modules";
        displayName = "Fuel Consumption";
        function = "JAGER_main_fnc_moduleFuelConsumption";
    };
    class JAGER_main_moduleUnarmed : JAGER_main_moduleBaseEden
    {
        category = "JAGER_main_modules";
        displayName = "Switch To Civilian If Unarmed";
        function = "JAGER_main_fnc_moduleUnarmed";
    };
};
