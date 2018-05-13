#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class grad_advancedLockpicking {
    class common {
        file = MODULES_DIRECTORY\grad-advancedLockpicking\functions\common;

        class addActionsToClass { postInit = 1; };
        class getVehicleColor {};
        class initModule { preInit = 1; };
    };

    class lockpicking {
        file = MODULES_DIRECTORY\grad-advancedLockpicking\functions\lockpicking;

        class canLockpick {};
        class carAlarm {};
        class getLockpickTime {};
        class isSuccess {};
        class lockpick {};
        class onFailure {};
        class onSuccess {};
        class onVehicleInit {};
        class onVehicleInitPost {};
    };

    class wantedList {
        file = MODULES_DIRECTORY\grad-advancedLockpicking\functions\wantedList;

        class addToWantedList {};
        class canOpenWantedList {};
        class findNearestTheft {};
        class onLBSelChanged {};
        class onMapClick {};
        class onMapDraw {};
        class openWantedList {};
        class updateDialog {};
        class updateInfoBox {};
        class updateMap {};
    };
};
