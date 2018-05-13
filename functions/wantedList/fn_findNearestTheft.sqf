#include "script_component.hpp"

params [["_searchPos",[0,0,0]]];

private _nearestTheft = "";
private _nearestDist = 9e10;

{
    (GVAR(wantedList) getVariable _x) params ["","","_theftPos"];

    _dist = _searchPos distance2D _theftPos;
    if (_dist < _nearestDist) then {
        _nearestTheft = _x;
        _nearestDist = _dist;
    };

    false
} count (allVariables GVAR(wantedList));

_nearestTheft
