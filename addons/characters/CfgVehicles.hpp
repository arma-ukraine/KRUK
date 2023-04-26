class CfgVehicles
{
    // Base module class.
    class EGVAR(main, moduleBaseEden);
    class EGVAR(main, moduleBaseZeus);
    class EGVAR(main, moduleBaseBoth);

    // Actual modules.
    class GVAR(moduleCharacters) : EGVAR(main, moduleBaseEden)
    {
        displayName = "JAGER Characters";
        category = QGVAR(modules);
        function = QFUNC(moduleCharacters);
    };
};
