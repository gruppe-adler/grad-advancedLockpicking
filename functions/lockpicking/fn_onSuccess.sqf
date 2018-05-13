#include "script_component.hpp"

(_this select 0) params [["_veh",objNull],["_unit",objNull],["_failed",false]];

private _alarmTriggered = (random 100) < (_veh getVariable [QGVAR(alarmOnSuccessProbability),GVAR(alarmOnSuccessProbabilityDefault)]);

if (_alarmTriggered) then {
    [_veh,GVAR(alarmDurationMinMax) call BIS_fnc_randomNum] call FUNC(carAlarm);
};

if (random 100 < (_veh getVariable [QGVAR(wantedListOnSuccessProbability),GVAR(wantedListOnSuccessProbabilityDefault)])) then {
    [{_this remoteExec [QFUNC(addToWantedList),2,false]},[_veh,_unit,_failed,_alarmTriggered],GVAR(wantedListDelayOnSuccess)] call CBA_fnc_waitAndExecute;
};

["ace_vehiclelock_setVehicleLock",[_veh,false],[_veh]] call CBA_fnc_targetEvent;
