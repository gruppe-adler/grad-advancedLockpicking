#include "script_component.hpp"
#include "..\..\dialog\defines.hpp"

params [["_display",findDisplay GRAD_IDD_DIALOG]];

private _ctrlListNBox = _display displayCtrl GRAD_IDC_LISTNBOX;
lnbClear _ctrlListNBox;

{
    (GVAR(wantedList) getVariable _x) params ["_veh","_vehClassName","_theftPos","_date","_status","_thiefName","_vehicleDisplayName","_plateNumber","_vehColor"];

    _statusStr = ["attempted","stolen","solved"] select _status;
    _rowID = _ctrlListNBox lnbAddRow [format ["%1:%2",_date select 3,_date select 4],_vehicleDisplayName,_statusStr];
    _ctrlListNBox lnbSetData [[_rowID,0],_x];

    false
} count (allVariables GVAR(wantedList));
