#include "script_component.hpp"
#include "..\..\dialog\defines.hpp"

params [["_buttonCtrl",controlNull]];

private _display = ctrlParent _buttonCtrl;
if (isNull _display) exitWith {false};

private _ctrlListNBox = _display displayCtrl GRAD_IDC_LISTNBOX;
private _curSelVarname = _ctrlListNBox lnbData [lnbCurSelRow _ctrlListNBox,0];

[_curSelVarname,2,name ACE_player] remoteExec [QFUNC(setStatus),2,false];
