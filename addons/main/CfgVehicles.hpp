class CfgVehicles
{
    // Base module class.
    class Module_F;

    // Base JAGER modules.
    class GVAR(moduleBase) : Module_F
    {
        author = "DiRaven#0001";
        category = "NO_CATEGORY";
        function = "";
        curatorCanAttach = 0;
    };
    class GVAR(moduleBaseEden) : GVAR(moduleBase)
    {
        scope = 2;
        scopeCurator = 1;
    };
    class GVAR(moduleBaseZeus) : GVAR(moduleBase)
    {
        scope = 1;
        scopeCurator = 2;
    };
    class GVAR(moduleBaseBoth) : GVAR(moduleBase)
    {
        scope = 2;
        scopeCurator = 2;
    };

    // Actual modules.
    class GVAR(moduleAoeHint) : GVAR(moduleBaseZeus)
    {
        displayName = "AOE Hint";
        category = QGVAR(modules);
        function = QFUNC(moduleAoeHint);
    };
    class GVAR(moduleBodyLoot) : GVAR(moduleBaseEden)
    {
        displayName = "Body Loot";
        category = QGVAR(modules);
        function = QFUNC(moduleBodyLoot);
    };
    class GVAR(moduleColorCorrection) : GVAR(moduleBaseEden)
    {
        displayName = "Color Correction";
        category = QGVAR(modules);
        function = QFUNC(moduleColorCorrection);
    };
    class GVAR(moduleEditorDynamicSimulation) : GVAR(moduleBaseEden)
    {
        displayName = "All Eden Units Dynamic Simulation";
        category = QGVAR(modules);
        function = QFUNC(moduleEditorDynamicSimulation);
    };
    class GVAR(moduleFuelConsumption) : GVAR(moduleBaseEden)
    {
        displayName = "Fuel Consumption";
        category = QGVAR(modules);
        function = QFUNC(moduleFuelConsumption);
    };
    class GVAR(moduleUnarmed) : GVAR(moduleBaseEden)
    {
        displayName = "Switch To Civilian If Unarmed";
        category = QGVAR(modules);
        function = QFUNC(moduleUnarmed);
    };
};
