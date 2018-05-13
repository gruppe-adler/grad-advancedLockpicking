#include "script_component.hpp"

params [["_varName",""],["_status",0],["_caseSolver",""]];

if (!isServer) exitWith {};
if (_varName == "") exitWith {};

private _theftData = GVAR(wantedList) getVariable [_varName,[]];

_theftData set [4,_status];
_theftData set [9,_caseSolver];

[] remoteExec [QFUNC(updateDialog),0,false];
