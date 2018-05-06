#include "script_component.hpp"

(_this select 0) params [["_veh",objNull],["_unit",objNull],["_failed",false]];

if (random 100 < (_veh getVariable [QGVAR(alarmOnSuccessProbability),sGVAR(alarmOnSuccessProbabilityDefault)])) then {
    [_veh,GVAR(alarmDurationMinMax) call BIS_fnc_randomNum] call FUNC(carAlarm);
};

if (random 100 < (_veh getVariable [QGVAR(wantedListOnSuccessProbability),GVAR(wantedListOnSuccessProbabilityDefault)])) then {
    [_veh,_unit,_failed] remoteExec [QFUNC(addToWantedList),2,false];
};

systemChat "onSuccess";

["ace_vehiclelock_setVehicleLock",[_veh,false],[_veh]] call CBA_fnc_targetEvent;
