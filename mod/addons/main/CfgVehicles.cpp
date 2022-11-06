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

    class GVAR(moduleLoadCharacter) : GVAR(moduleBase)
    {
        curatorCanAttach = 1;
        category = QGVAR(Persistence);
        displayName = QGVAR(Load);
        function = QFUNC(moduleLoadCharacter);
    };

    class GVAR(moduleSaveCharacter) : GVAR(moduleBase)
    {
        curatorCanAttach = 1;
        category = QGVAR(Persistence);
        displayName = QGVAR(Save);
        function = QFUNC(moduleSaveCharacter);
    };
};
