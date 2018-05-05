#include "script_component.hpp"

params [["_veh",objNull],["_unit",objNull],["_actionParams",[]]];

if (isNull _caller) exitWith {ERROR("null unit"); false};
if (isNull _veh) exitWith {ERROR("null vehicle"); false};

//Exit if vehicle unlocked:
if ((locked _veh) == 0) exitWith {false};

//need lockpick item
if (!("ACE_key_lockpick" in (items _unit))) exitWith {false};

private _vehLockpickStrenth = _veh getVariable[QGVAR(lockpickStrength),GVAR(DefaultLockpickStrength)];
if (!(_vehLockpickStrenth isEqualType 0)) exitWith {ERROR("grad_advancedLockpicking_lockpickStrength invalid"); false};

//-1 indicates unpickable lock
if (_vehLockpickStrenth < 0) exitWith {false};

//Condition check for progressBar
private _condition = {
    params ["_args"];
    _args params ["_unit", "_veh"];
    ((_unit distance _veh) < 5) && {(speed _veh) < 0.1}
};

if (!([[_unit, _veh]] call _condition)) exitWith {false};


// TODO
_unlockTime = 3;
_isFailure = false;

[
    localize "str_ace_vehiclelock_action_lockpickInUse",
    _unlockTime,
    _condition,
    FUNC(onSuccess),
    {},
    [_veh,_unit,_isFailure]
] call CBA_fnc_progressBar;
