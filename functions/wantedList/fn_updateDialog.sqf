#include "script_component.hpp"
#include "..\..\dialog\defines.hpp"

if (!hasInterface) exitWith {};

params [["_display",findDisplay GRAD_IDD_DIALOG]];

if (isNull _display) exitWith {};

private _ctrlListNBox = _display displayCtrl GRAD_IDC_LISTNBOX;

private _prevSize = (lnbSize _ctrlListNBox) select 0;
private _prevSel = lnbCurSelRow _ctrlListNBox;

lnbClear _ctrlListNBox;

{
    (GVAR(wantedList) getVariable _x) params ["_veh","_vehClassName","_theftPos","_date","_status","_thiefName","_vehicleDisplayName","_plateNumber","_vehColor"];

    _statusStr = ["attempted","stolen","solved"] select _status;
    _rowID = _ctrlListNBox lnbAddRow [format ["%1:%2",_date select 3,_date select 4],_vehicleDisplayName,_statusStr];
    _ctrlListNBox lnbSetData [[_rowID,0],_x];    

    false
} count (allVariables GVAR(wantedList));

private _curSize = (lnbSize _ctrlListNBox) select 0;
_prevSel = [_prevSel + _curSize - _prevSize,0] select (_prevSel < 0);

if (_prevSel < _curSize) then {
    _ctrlListNBox lnbSetCurSelRow _prevSel;
} else {
    _ctrlListNBox lnbSetCurSelRow ([-1,0] select (_curSize > 0));
};
