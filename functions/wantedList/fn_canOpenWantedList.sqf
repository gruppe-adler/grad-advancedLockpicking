#include "script_component.hpp"

params [["_unit",objNull],"",["_actionParams",[]]];

(side _unit) in GVAR(canUseWantedListSides) ||
[_unit] call GVAR(canUseWantedListCondition)
