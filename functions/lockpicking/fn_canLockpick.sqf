#include "script_component.hpp"

params [["_veh",objNull],["_unit",objNull],["_actionParams",[]]];

(locked _veh) in [2,3] &&
{!([_unit,_veh] call ace_vehiclelock_fnc_hasKeyForVehicle)}
