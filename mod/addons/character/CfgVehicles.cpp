class CfgVehicles
{
    class Module_F;

    class GVAR(moduleBase) : Module_F
    {
        author = ECSTRING(main, Author);
        category = "NO_CATEGORY";
        function = "";
        scope = 1;
        scopeCurator = 2;
    };

    class GVAR(moduleLoad) : GVAR(moduleBase)
    {
        curatorCanAttach = 1;
        category = QGVAR(Characters);
        displayName = QGVAR(Load);
        function = QFUNC(moduleLoad);
    };

    class GVAR(moduleSave) : GVAR(moduleBase)
    {
        curatorCanAttach = 1;
        category = QGVAR(Characters);
        displayName = QGVAR(Save);
        function = QFUNC(moduleSave);
    };
};
