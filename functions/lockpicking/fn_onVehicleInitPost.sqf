#include "script_component.hpp"

params [["_veh",objNull]];

//basically disable ACE lockpicking by making every lock unpickable --> ace lockpicking interaction doesnt show up
_veh setVariable ["ace_vehiclelock_lockpickStrength",-1];
