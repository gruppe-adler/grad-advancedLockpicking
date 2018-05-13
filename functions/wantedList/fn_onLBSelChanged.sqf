#include "script_component.hpp"
#include "..\..\dialog\defines.hpp"

params [["_ctrlListNBox",controlNull],["_curSelID",-1]];

private _curSelVarname = _ctrlListNBox lnbData [_curSelID,0];
private _curSelData = GVAR(wantedList) getVariable [_curSelVarname,[]];

_curSelData params ["",["_vehClassName",""],["_theftPos",[0,0,0]],["_date",[0,0,0,0,0]],["_status",0],["_thiefName",""],["_vehicleDisplayName",""],["_plateNumber",""],["_vehColor",""]];

private _display = ctrlParent _ctrlListNBox;

[_display,_theftPos] call FUNC(updateMap);
[_display,_vehClassName,_date,_status,_thiefName,_vehicleDisplayName,_plateNumber,_vehColor] call FUNC(updateInfoBox);


diag_log _curSelData;
diag_log _this
