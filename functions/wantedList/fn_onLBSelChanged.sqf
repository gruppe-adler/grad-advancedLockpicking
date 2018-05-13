#include "script_component.hpp"
#include "..\..\dialog\defines.hpp"

params [["_ctrlListNBox",controlNull],["_curSelID",-1]];

private _curSelVarname = _ctrlListNBox lnbData [_curSelID,0];
private _curSelData = GVAR(wantedList) getVariable [_curSelVarname,[]];

_curSelData params ["",["_vehClassName",""],["_theftPos",[0,0,0]],["_date",[0,0,0,0,0]],["_status",0],["_thiefName",""],["_vehicleDisplayName",""],["_plateNumber",""],["_vehColor",""],["_caseSolver",""]];

private _display = ctrlParent _ctrlListNBox;

[_display,_theftPos] call FUNC(updateMap);
[_display,_vehClassName,_date,_status,_thiefName,_vehicleDisplayName,_plateNumber,_vehColor,_caseSolver] call FUNC(updateInfoBox);

for [{_i=0},{_i<((lnbSize _ctrlListNBox) select 0)},{_i=_i+1}] do {
    _activeColor = [[1,1,1,1],[0,0,0,1]] select (_i == (lnbCurSelRow _ctrlListNBox));

    (GVAR(wantedList) getVariable [_ctrlListNBox lnbData [_i,0],[]]) params ["","","","","_rowStatus"];

    for [{_j=0},{_j<((lnbSize _ctrlListNBox) select 1)},{_j=_j+1}] do {
        _ctrlListNBox lnbSetColor [[_i,_j],[[0.5,0.5,0.5,1],_activeColor] select (_rowStatus < 2 || _i == (lnbCurSelRow _ctrlListNBox))];
    };
};


private _solvedButtonCtrl = _display displayCtrl GRAD_IDC_SOLVEDBUTTON;
_solvedButtonCtrl ctrlEnable (_status < 2);
