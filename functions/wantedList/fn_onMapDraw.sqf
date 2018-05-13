#include "script_component.hpp"

params [["_mapCtrl",controlNull]];

{
    (GVAR(mapIconList) getVariable _x) params ["_theftPos","_vehIcon","_color","_time"];
    _mapCtrl drawIcon [_vehIcon,_color,_theftPos,24,24,0,_time,2,0.03,"RobotoCondensed","right"];

    false
} count allVariables GVAR(mapIconList);
