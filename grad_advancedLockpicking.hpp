#include "script_component.hpp"

// base classes only, no effect by themselves
class grad_advancedLockpicking_vehicleInitEH {
    init = QUOTE(_this call FUNC(onVehicleInit));
};
class grad_advancedLockpicking_vehicleInitPostEH {
    init = QUOTE(_this call FUNC(onVehicleInitPost));
};


class Extended_Init_EventHandlers {
    class Car {
        class grad_advancedLockpicking_initEH: grad_advancedLockpicking_vehicleInitEH {};
    };
    class Tank {
        class grad_advancedLockpicking_initEH: grad_advancedLockpicking_vehicleInitEH {};
    };
    class Helicopter {
        class grad_advancedLockpicking_initEH: grad_advancedLockpicking_vehicleInitEH {};
    };
    class Motorcycle {
        class grad_advancedLockpicking_initEH: grad_advancedLockpicking_vehicleInitEH {};
    };
    class Ship_F {
        class grad_advancedLockpicking_initEH: grad_advancedLockpicking_vehicleInitEH {};
    };
};


class Extended_InitPost_EventHandlers {
    class Car {
        class grad_advancedLockpicking_initPostEH: grad_advancedLockpicking_vehicleInitPostEH {};
    };
    class Tank {
        class grad_advancedLockpicking_initPostEH: grad_advancedLockpicking_vehicleInitPostEH {};
    };
    class Helicopter {
        class grad_advancedLockpicking_initPostEH: grad_advancedLockpicking_vehicleInitPostEH {};
    };
    class Motorcycle {
        class grad_advancedLockpicking_initPostEH: grad_advancedLockpicking_vehicleInitPostEH {};
    };
    class Ship_F {
        class grad_advancedLockpicking_initPostEH: grad_advancedLockpicking_vehicleInitPostEH {};
    };
};
