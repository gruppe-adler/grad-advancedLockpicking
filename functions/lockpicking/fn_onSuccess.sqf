#include "script_component.hpp"

(_this select 0) params [["_veh",objNull],["_unit",objNull],["_isFailure",false]];

if (_isFailure) exitWith {_this call FUNC(onFailure)};

systemChat "onSuccess";

systemChat str _veh;
["ace_vehiclelock_setVehicleLock",[_veh,false],[_veh]] call CBA_fnc_targetEvent;
