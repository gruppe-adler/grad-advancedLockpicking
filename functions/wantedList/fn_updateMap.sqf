#include "script_component.hpp"
#include "..\..\dialog\defines.hpp"

params [["_display",displayNull],["_theftPos",[0,0,0]]];

private _mapCtrl = _display displayCtrl GRAD_IDC_MAP;
private _mapHeadlineCtrl = _display displayCtrl GRAD_IDC_HEADLINEMAP;

ctrlMapAnimClear _mapCtrl;
_mapCtrl ctrlMapAnimAdd [0.5,ctrlMapScale _mapCtrl,_theftPos];
ctrlMapAnimCommit _mapCtrl;

private _nearestLocations = nearestLocations [_theftPos,["Airport","NameMarine","NameCityCapital","NameCity","NameVillage","NameLocal"],2000];
private _headlineText = if (count _nearestLocations > 0) then {
    format ["NEAR %1",toUpper text (_nearestLocations select 0)];
} else {
    format ["AT %1",_theftPos apply {round _x}];
};
_mapHeadlineCtrl ctrlSetText _headlineText;
