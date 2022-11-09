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

    class GVAR(moduleAoeHint) : GVAR(moduleBase)
    {
        curatorCanAttach = 1;
        category = QGVAR(Rp);
        displayName = QGVAR(AoeHint);
        function = QFUNC(moduleAoeHint);
    };
};
