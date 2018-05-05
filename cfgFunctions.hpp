#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class grad_advancedLockpicking {
    class common {
        file = MODULES_DIRECTORY\grad-advancedLockpicking\functions\common;

        class initModule { preInit = 1; };
    };

    class lockpicking {
        file = MODULES_DIRECTORY\grad-advancedLockpicking\functions\lockpicking;

        class addActionsToClass { postInit = 1; };
        class canLockpick {};
        class lockpick {};
        class onFailure {};
        class onSuccess {};
        class onVehicleInit {};
        class onVehicleInitPost {};
    };

    class wantedList {
        file = MODULES_DIRECTORY\grad-advancedLockpicking\functions\wantedList;

    };
};
