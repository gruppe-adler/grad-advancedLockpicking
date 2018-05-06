#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class grad_advancedLockpicking {
    class common {
        file = MODULES_DIRECTORY\grad-advancedLockpicking\functions\common;

        class getVehicleColor {};
        class initModule { preInit = 1; };
    };

    class lockpicking {
        file = MODULES_DIRECTORY\grad-advancedLockpicking\functions\lockpicking;

        class addActionsToClass { postInit = 1; };
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
        class onMapDraw {};
        class openWantedList {};
        class updateDialog {};
    };
};
