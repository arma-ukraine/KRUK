class CfgVehicles
{
  class EventHandlers;

  // == MRAZOTA ==

  // Melee fists.
  class O_soldier_Melee_fists;
  class GVAR(Mrazota_Melee_Fists) : O_soldier_Melee_fists
  {
    faction = QGVAR(Mrazota);
    displayName = "Melee Fists";
#include "CfgVehiclesRandomizedGear.hpp"
  };

  // Melee fists rusher.
  class O_soldier_Melee_RUSH_fists;
  class GVAR(Mrazota_Melee_Fists_Rusher) : O_soldier_Melee_RUSH_fists
  {
    faction = QGVAR(Mrazota);
    displayName = "Melee Fists Rusher";
#include "CfgVehiclesRandomizedGear.hpp"
  };

  // Melee weapon.
  class O_soldier_Melee;
  class GVAR(Mrazota_Melee_Weapon) : O_soldier_Melee
  {
    faction = QGVAR(Mrazota);
    displayName = "Melee Weapon";
#include "CfgVehiclesRandomizedGear.hpp"
  };

  // Melee weapon rusher.
  class O_soldier_Melee_RUSH;
  class GVAR(Mrazota_Melee_Weapon_Rusher) : O_soldier_Melee_RUSH
  {
    faction = QGVAR(Mrazota);
    displayName = "Melee Weapon Rusher";
#include "CfgVehiclesRandomizedGear.hpp"
  };

  // Shooter.
  class O_Soldier_F;
  class GVAR(Mrazota_Firearms_Handgun) : O_Soldier_F
  {
    faction = QGVAR(Mrazota);
    displayName = "Firearms Handgun";
#include "CfgVehiclesRandomizedGear.hpp"
  };

  // == MUTANTS ==
  // Dogs.
  class armst_blinddog3;
  class GVAR(Mutants_Blind_Dog_Grey) : armst_blinddog3
  {
    faction = QGVAR(Mutants);
    displayName = "Blind Dog (Grey)";
  };
  class armst_blinddog;
  class GVAR(Mutants_Blind_Dog_Brown) : armst_blinddog
  {
    faction = QGVAR(Mutants);
    displayName = "Blind Dog (Brown)";
  };
  class armst_blinddog2;
  class GVAR(Mutants_Blind_Dog_White) : armst_blinddog2
  {
    faction = QGVAR(Mutants);
    displayName = "Blind Dog (White)";
  };
};
