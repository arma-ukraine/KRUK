class CfgVehicles
{
  class EventHandlers;

  // == MRAZOTA ==

  // Melee fists.
  class O_soldier_Melee_fists;
  class GVAR(Mrazota_Melee_Fists) : O_soldier_Melee_fists
  {
    displayName = "Melee Fists";
    faction = QGVAR(Mrazota);
#include "CfgVehiclesRandomizedGear.hpp"
  };

  // Melee fists rusher.
  class O_soldier_Melee_RUSH_fists;
  class GVAR(Mrazota_Melee_Fists_Rusher) : O_soldier_Melee_RUSH_fists
  {
    displayName = "Melee Fists Rusher";
    faction = QGVAR(Mrazota);
#include "CfgVehiclesRandomizedGear.hpp"
  };

  // Melee weapon.
  class O_soldier_Melee;
  class GVAR(Mrazota_Melee_Weapon) : O_soldier_Melee
  {
    displayName = "Melee Weapon";
    faction = QGVAR(Mrazota);
#include "CfgVehiclesRandomizedGear.hpp"
  };

  // Melee weapon rusher.
  class O_soldier_Melee_RUSH;
  class GVAR(Mrazota_Melee_Weapon_Rusher) : O_soldier_Melee_RUSH
  {
    displayName = "Melee Weapon Rusher";
    faction = QGVAR(Mrazota);
#include "CfgVehiclesRandomizedGear.hpp"
  };

  // Shooter.
  class O_Soldier_F;
  class GVAR(Mrazota_Firearms_Handgun) : O_Soldier_F
  {
    displayName = "Firearms Handgun";
    faction = QGVAR(Mrazota);
#include "CfgVehiclesRandomizedGear.hpp"
  };

  // == MUTANTS ==
  // Dogs.
//   class armst_blinddog3;
//   class GVAR(Mutants_Blind_Dog_Grey) : armst_blinddog3
//   {
//     faction = QGVAR(Mutants);
//     displayName = "Blind Dog (Grey)";
//   };
};
