#include "script_component.hpp"

if (!hasInterface) exitWith {};
if !([ACE_player] call FUNC(canOpenWantedList)) exitWith {};
    
[QGVAR(defaultNotification),_this] call BIS_fnc_showNotification;
