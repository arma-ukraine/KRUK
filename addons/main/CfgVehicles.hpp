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

#include "CfgModules.hpp"
};
