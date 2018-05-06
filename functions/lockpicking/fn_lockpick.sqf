/*
*   Heavily based on ace_vehicle_fnc_lockpick by PabstMirror.
*   Adaptations made by McDiod, 05-05-2018
*/

#include "script_component.hpp"

params [["_veh",objNull],["_unit",objNull],["_actionParams",[]]];

if (isNull _caller) exitWith {ERROR("null unit"); false};
if (isNull _veh) exitWith {ERROR("null vehicle"); false};

//Exit if vehicle unlocked:
if ((locked _veh) == 0) exitWith {INFO("unit executed fnc_lockpick, but vehicle not locked"); false};

//need lockpick item
if (!("ACE_key_lockpick" in (items _unit))) exitWith {INFO("unit executed fnc_lockpick, but lockpick set not in inventory");false};

private _vehLockpickStrenth = _veh getVariable[QGVAR(lockpickStrength),GVAR(defaultLockpickStrength)];
if (!(_vehLockpickStrenth isEqualType 0)) exitWith {ERROR("grad_advancedLockpicking_lockpickStrength invalid"); false};

//-1 indicates unpickable lock
if (_vehLockpickStrenth < 0) exitWith {false};

//Condition check for progressBar
private _condition = {
    params ["_args","","_elapsedTime"];
    _args params ["_unit", "_veh","_failed","_failureTime","_isGoingToBeSuccess"];

    _failed = false;
    if (!_isGoingToBeSuccess && _failureTime < _elapsedTime) then {
        _args set [2,true];
        _failed = true;
    };

    !_failed &&
    ((_unit distance _veh) < 5) &&
    {(speed _veh) < 0.1}
};

if (!([[_unit, _veh]] call _condition)) exitWith {false};


private _lockpickTime = [_veh,_unit] call FUNC(getLockpickTime);
private _isSuccess = [_veh,_unit] call FUNC(isSuccess);
private _failureTime = if (_isSuccess) then {-1} else {(random _lockpickTime) max 0.8};

systemChat format ["is success: %1",_isSuccess];
systemChat format ["lockpick time: %1",_lockpickTime];
systemChat format ["failure time: %1",_failureTime];

[localize "str_ace_vehiclelock_action_lockpickInUse",_lockpickTime,_condition,FUNC(onSuccess),FUNC(onFailure),[_veh,_unit,false,_failureTime,_isSuccess]] call CBA_fnc_progressBar;
