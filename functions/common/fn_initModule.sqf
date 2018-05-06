#include "script_component.hpp"

private _moduleConfig = missionConfigFile >> "CfgGradAdvancedLockpicking";


GVAR(canLockpickDefault) = ([_moduleConfig,"canLockpickDefault",1] call BIS_fnc_returnConfigEntry) == 1;

GVAR(baseLockpickTimeDefault) = [_moduleConfig,"baseLockpickTimeDefault",10] call BIS_fnc_returnConfigEntry;
GVAR(baseSuccessProbabilityDefault) = [_moduleConfig,"baseSuccessProbabilityDefault",75] call BIS_fnc_returnConfigEntry;

GVAR(alarmDurationMinMax) = [_moduleConfig,"alarmDurationMinMax",[10,30]] call BIS_fnc_returnConfigEntry;

GVAR(alarmOnSuccessProbabilityDefault) = [_moduleConfig,"alarmOnSuccessProbabilityDefault",10] call BIS_fnc_returnConfigEntry;
GVAR(wantedListOnSuccessProbabilityDefault) = [_moduleConfig,"wantedListOnSuccessProbabilityDefault",50] call BIS_fnc_returnConfigEntry;

GVAR(specialistTimeFactor) = [_moduleConfig,"specialistTimeFactor",0.7] call BIS_fnc_returnConfigEntry;
GVAR(specialistSuccessFactor) = [_moduleConfig,"specialistSuccessFactor",1.5] call BIS_fnc_returnConfigEntry;

GVAR(canPickCar) = ([_moduleConfig,"canPickCar",1] call BIS_fnc_returnConfigEntry) == 1;
GVAR(carTimeFactor) = [_moduleConfig,"carTimeFactor",1] call BIS_fnc_returnConfigEntry;
GVAR(carSuccessFactor) = [_moduleConfig,"carSuccessFactor",1] call BIS_fnc_returnConfigEntry;

GVAR(canPickMotorcycle) = ([_moduleConfig,"canPickMotorcycle",1] call BIS_fnc_returnConfigEntry) == 1;
GVAR(motorcycleTimeFactor) = [_moduleConfig,"motorcycleTimeFactor",0.7] call BIS_fnc_returnConfigEntry;
GVAR(motorcycleSuccessFactor) = [_moduleConfig,"motorcycleSuccessFactor",1.5] call BIS_fnc_returnConfigEntry;

GVAR(canPickBoat) = ([_moduleConfig,"canPickBoat",1] call BIS_fnc_returnConfigEntry) == 1;
GVAR(boatTimeFactor) = [_moduleConfig,"boatTimeFactor",1] call BIS_fnc_returnConfigEntry;
GVAR(boatSuccessFactor) = [_moduleConfig,"boatSuccessFactor",1] call BIS_fnc_returnConfigEntry;

GVAR(canPickTank) = ([_moduleConfig,"canPickTank",0] call BIS_fnc_returnConfigEntry) == 1;
GVAR(tankTimeFactor) = [_moduleConfig,"tankTimeFactor",5] call BIS_fnc_returnConfigEntry;
GVAR(tankSuccessFactor) = [_moduleConfig,"tankSuccessFactor",0.5] call BIS_fnc_returnConfigEntry;

GVAR(canPickHelicopter) = ([_moduleConfig,"canPickHelicopter",0] call BIS_fnc_returnConfigEntry) == 1;
GVAR(helicopterTimeFactor) = [_moduleConfig,"helicopterTimeFactor",2] call BIS_fnc_returnConfigEntry;
GVAR(helicopterSuccessFactor) = [_moduleConfig,"helicopterSuccessFactor",0.9] call BIS_fnc_returnConfigEntry;

GVAR(canPickPlane) = ([_moduleConfig,"canPickPlane",0] call BIS_fnc_returnConfigEntry) == 1;
GVAR(planeTimeFactor) = [_moduleConfig,"planeTimeFactor",3] call BIS_fnc_returnConfigEntry;
GVAR(planeSuccessFactor) = [_moduleConfig,"planeSuccessFactor",0.7] call BIS_fnc_returnConfigEntry;


if (isServer) then {
    GVAR(wantedList) = [true] call CBA_fnc_createNamespace;
    publicVariable QGVAR(wantedList);
};
