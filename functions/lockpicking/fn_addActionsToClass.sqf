#include "script_component.hpp"

private _lockpickAction = [
    QGVAR(lockpickAction),
    localize "str_ace_vehiclelock_action_unlock",
    "",
    {[FUNC(lockpick),_this] call CBA_fnc_execNextFrame},
    FUNC(canLockpick)
] call ace_interact_menu_fnc_createAction;

{
    [_x,0,["ACE_MainActions"],_lockpickAction,true] call ace_interact_menu_fnc_addActionToClass;
    false
} count ["Car","Tank","Helicopter","Plane","Motorcycle","Ship_F"];
