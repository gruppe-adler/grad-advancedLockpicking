#include "script_component.hpp"
#include "..\..\dialog\defines.hpp"

params [["_mapCtrl",controlNull],["_buttonID",-1],["_clickPosX",-1],["_clickPosY",-1]];

// only left click
if (_buttonID != 0) exitWith {};

if (_clickPosX < 0 || _clickPosY < 0) exitWith {};

private _mousePosWorld = _mapCtrl ctrlMapScreenToWorld [_clickPosX,_clickPosY];

private _nearestTheft = [_mousePosWorld] call FUNC(findNearestTheft);
if (_nearestTheft == "") exitWith {};

(GVAR(wantedList) getVariable _nearestTheft) params ["","","_nearestTheftPos"];

if ((_mapCtrl ctrlMapWorldToScreen _nearestTheftPos) distance2D [_clickPosX,_clickPosY] < 0.02) then {
    _ctrlListNBox = (ctrlParent _mapCtrl) displayCtrl GRAD_IDC_LISTNBOX;
    _lnbSize = (lnbSize _ctrlListNBox) select 0;
    for [{_i=0},{_i<_lnbSize},{_i=_i+1}] do {
        if ((_ctrlListNBox lnbData [_i,0]) == _nearestTheft) exitWith {
            _ctrlListNBox lnbSetCurSelRow _i;
        };
    };
};
