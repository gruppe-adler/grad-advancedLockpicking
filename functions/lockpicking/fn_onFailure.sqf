#include "script_component.hpp"

(_this select 0) params [["_veh",objNull],["_unit",objNull],["_failed",false]];

//user aborted lockpicking - it didnt actually fail
if (!_failed) exitWith {};

[_veh,GVAR(alarmDurationMinMax) call BIS_fnc_randomNum] call FUNC(carAlarm);

[{_this remoteExec [QFUNC(addToWantedList),2,false]},[_veh,_unit,_failed,true],GVAR(wantedListDelayOnFailure)] call CBA_fnc_waitAndExecute;
