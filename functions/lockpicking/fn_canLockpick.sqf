#include "script_component.hpp"

params [["_veh",objNull],["_unit",objNull],["_actionParams",[]]];

(locked _veh) in [2,3] &&
{"ACE_key_lockpick" in items _unit} &&
{!([_unit,_veh] call ace_vehiclelock_fnc_hasKeyForVehicle)} &&
{(_veh getVariable [QGVAR(baseLockpickTime),GVAR(baseLockpickTimeDefault)]) > 0} &&
{GVAR(canLockpickDefault) || _unit getVariable [QGVAR(isSpecialist),false] || _unit getVariable [QGVAR(canLockpick),false]}
