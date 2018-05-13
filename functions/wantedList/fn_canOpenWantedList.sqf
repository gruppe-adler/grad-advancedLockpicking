#include "script_component.hpp"

params [["_unit",objNull],"",["_actionParams",[]]];

alive _unit &&
((side _unit) in GVAR(canUseWantedListSides) || [_unit] call GVAR(canUseWantedListCondition))
