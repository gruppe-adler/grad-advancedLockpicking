#include "script_component.hpp"

(_this select 0) params [["_veh",objNull],["_unit",objNull],["_failed",false]];

//user aborted lockpicking - it didnt actually fail
if (!_failed) exitWith {};

[_veh,GVAR(alarmDurationMinMax) call BIS_fnc_randomNum] call FUNC(carAlarm);

[_veh,_unit,_isSuccess] remoteExec [QFUNC(addToWantedList),2,false];
systemChat "onFailure";
