#include "script_component.hpp"

if (!isServer) exitWith {};

params [["_veh",objNull],["_unit",objNull],["_failed",false]];

private _theftPos = getPos _veh;
private _vehColor = [_veh] call FUNC(getVehicleColor);
private _thiefName = name _unit;
private _carVar = [_veh call BIS_fnc_netId] call BIS_fnc_filterString;
private _vehicleDisplayName = [configFile >> "CfgVehicles" >> typeOf _veh,"displayname","unknown model"] call BIS_fnc_returnConfigEntry;

GVAR(wantedList) setVariable [_carVar,[_veh,_theftPos,date,_failed,_thiefName,_vehicleDisplayName,getPlateNumber _veh,_vehColor],true];

private _vehIcon = switch (true) do {
    case (_veh isKindOf "Truck_F"): {"iconTruck"};
    case (_veh isKindOf "Car"): {"iconCar"};
    case (_veh isKindOf "Motorcycle"): {"iconMotorcycle"};
    case (_veh isKindOf "Ship_F"): {"iconShip"};
    case (_veh isKindOf "Tank"): {"iconTank"};
    case (_veh isKindOf "Helicopter"): {"iconHelicopter"};
    case (_veh isKindOf "Plane"): {"iconPlane"};
    default {"iconVehicle"};
};
private _color = if (_failed) then {[0.7,0.7,0,1]} else {[0.8,0,0,1]};
GVAR(mapIconList) setVariable [_carVar,[_theftPos,_vehIcon,_color,format ["%1:%2",date select 3,date select 4]],true];








systemChat format ["Vehicle %1 stolen by %2 added to wanted list.",_veh,name _unit];
