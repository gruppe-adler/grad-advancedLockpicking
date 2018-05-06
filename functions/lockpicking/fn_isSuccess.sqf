#include "script_component.hpp"

params [["_veh",objNull],["_unit",objNull]];

private _vehicleSuccessFactor = switch (true) do {
    case (_veh isKindOf "Car"): {GVAR(carSuccessFactor)};
    case (_veh isKindOf "Motorcycle"): {GVAR(motorcycleSuccessFactor)};
    case (_veh isKindOf "Ship_F"): {GVAR(boatSuccessFactor)};
    case (_veh isKindOf "Tank"): {GVAR(tankSuccessFactor)};
    case (_veh isKindOf "Helicopter"): {GVAR(helicopterSuccessFactor)};
    case (_veh isKindOf "Plane"): {GVAR(planeSuccessFactor)};
    default {1};
};

private _specialistSuccessFactor = [1,GVAR(specialistSuccessFactor)] select (_unit getVariable [QGVAR(isSpecialist),false]);
private _baseSuccessProbability = _veh getVariable [QGVAR(baseSuccessProbability),GVAR(baseSuccessProbabilityDefault) * _vehicleSuccessFactor];

private _isSuccess = random 100 < ((_baseSuccessProbability * _specialistSuccessFactor) max 0 min 100);

_isSuccess
