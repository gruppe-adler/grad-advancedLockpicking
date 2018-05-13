#include "script_component.hpp"
#include "..\..\dialog\defines.hpp"

params [["_display",displayNull],["_vehClassName",""],["_date",[0,0,0,0,0]],["_status",0],["_thiefName",""],["_vehicleDisplayName",""],["_plateNumber",""],["_vehColor",""],["_caseSolver",""]];

if (isNull _display) exitWith {};

private _infoBoxHeadlineCtrl = _display displayCtrl GRAD_IDC_HEADLINEINFOBOX;
private _infoBoxLeftCtrl = _display displayCtrl GRAD_IDC_INFOBOXLEFT;
private _infoBoxRightCtrl = _display displayCtrl GRAD_IDC_INFOBOXRIGHT;
private _infoBoxPicCtrl = _display displayCtrl GRAD_IDC_INFOBOXPIC;

_infoBoxHeadlineCtrl ctrlSetText _vehicleDisplayName;

private _dateStr = format ["%1.%2.%3",_date select 2,_date select 1,_date select 0];
private _timeStr = format ["%1:%2%3",_date select 3,["0",""] select ((_date select 4) >= 10),_date select 4];
private _statusStr = ["attempted break-in","vehicle stolen","case solved"] select _status;

private _leftArray = [];
private _rightArray = [];

{
    _x params ["_leftStr","_rightStr"];

    if (_rightStr != "") then {
        _leftArray pushBack _leftStr;
        _leftArray pushBack lineBreak;
        _rightArray pushBack _rightStr;
        _rightArray pushBack lineBreak;
    };

} forEach [
    ["Status",_statusStr],
    ["Date",_dateStr],
    ["Time",_timeStr],
    ["Suspect",_thiefName],
    ["Plate Number",_plateNumber],
    ["Color",_vehColor],
    [" "," "],
    ["Marked as solved by:",_caseSolver]
];


_infoBoxLeftCtrl ctrlSetStructuredText composeText _leftArray;
_infoBoxRightCtrl ctrlSetStructuredText composeText _rightArray;

private _picPath = [configFile >> "CfgVehicles" >> _vehClassName,"picture",""] call BIS_fnc_returnConfigEntry;
_infoBoxPicCtrl ctrlSetText _picPath;
