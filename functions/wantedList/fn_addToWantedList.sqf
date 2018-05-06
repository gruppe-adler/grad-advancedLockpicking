#include "script_component.hpp"

if (!isServer) exitWith {};

params [["_veh",objNull],["_unit",objNull],["_failed",false]];

private _theftPos = getPos _veh;
private _vehColor = [_veh] call FUNC(getVehicleColor);
private _thiefName = name _unit;
private _thiefVar = [_thiefName] call BIS_fnc_filterString;
private _vehicleDisplayName = [configFile >> "CfgVehicles" >> typeOf _veh,"displayname","unknown model"] call BIS_fnc_returnConfigEntry;

// get all thefts of unit
private _allThefts = GVAR(wantedList) getVariable [_thiefVar,[]];

// remove entries of same vehicle by same thief
{
    if (_x select 0 == _veh) exitWith {
        _allThefts deleteAt _forEachIndex;
    };
} forEach _allThefts;

// add new theft data
_allThefts pushBack [_veh,_thiefName,_theftPos,_vehicleDisplayName,getPlateNumber _veh,_vehColor,date,_failed];
GVAR(wantedList) setVariable [_thiefVar,_allThefts,true];


systemChat format ["Vehicle %1 stolen by %2 added to wanted list.",_veh,name _unit];

/* [_theftPos] call FUNC(theftMarker); */
