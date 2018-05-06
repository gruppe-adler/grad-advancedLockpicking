#include "script_component.hpp"

params [["_veh",objNull],["_unit",objNull]];

private _vehicleTimeFactor = switch (true) do {
    case (_veh isKindOf "Car"): {GVAR(carTimeFactor)};
    case (_veh isKindOf "Motorcycle"): {GVAR(motorcycleTimeFactor)};
    case (_veh isKindOf "Ship_F"): {GVAR(boatTimeFactor)};
    case (_veh isKindOf "Tank"): {GVAR(tankTimeFactor)};
    case (_veh isKindOf "Helicopter"): {GVAR(helicopterTimeFactor)};
    case (_veh isKindOf "Plane"): {GVAR(planeTimeFactor)};
    default {1};
};

private _specialistTimeFactor = [1,GVAR(specialistTimeFactor)] select (_unit getVariable [QGVAR(isSpecialist),false]);
private _baseTime = _veh getVariable [QGVAR(baseLockpickTime),GVAR(baseLockpickTimeDefault) * _vehicleTimeFactor];

private _lockpickTime = (_baseTime * _specialistTimeFactor) max 1;


_lockpickTime
