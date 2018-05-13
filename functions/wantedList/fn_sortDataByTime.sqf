#include "script_component.hpp"

params [["_varNames",[]]];

private _varNamesWithTime = _varNames apply {
    _time = (GVAR(wantedList) getVariable _x) param [10,0];
    [_time,_x]
};

_varNamesWithTime sort false;

_varNamesWithTime apply {_x select 1}
