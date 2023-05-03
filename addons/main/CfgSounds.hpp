class CfgSounds
{
  sounds[] = {}; // OFP required it filled, now it can be empty or absent depending on the game's version

  class Hungry
  {
    name = "Hungry Sound";                                   // display name
    sound[] = {QPATHTOF(data\sounds\hungry.ogg), 1, 1, 100}; // file, volume, pitch, maxDistance
    titles[] = {0, ""};                                      // subtitles

    forceTitles = 0;      // Arma 3 - display titles even if global show titles option is off (1) or not (0)
    titlesStructured = 1; // Arma 3 - treat titles as Structured Text (1) or not (0)
  };
};