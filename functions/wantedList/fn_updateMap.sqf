#include "script_component.hpp"
#include "..\..\dialog\defines.hpp"

params [["_display",displayNull],["_theftPos",[0,0,0]]];

private _mapCtrl = _display displayCtrl GRAD_IDC_MAP;
private _mapHeadlineCtrl = _display displayCtrl GRAD_IDC_MAP;

ctrlMapAnimClear _mapCtrl;
_mapCtrl ctrlMapAnimAdd [0.5,ctrlMapScale _mapCtrl,_theftPos];
ctrlMapAnimCommit _mapCtrl;
