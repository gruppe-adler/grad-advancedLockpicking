#include "script_component.hpp"

if (!isServer) exitWith {};

params [["_veh",objNull],["_unit",objNull],["_failed",false]];

private _theftPos = getPos _veh;
private _vehColor = [_veh] call FUNC(getVehicleColor);
private _thiefName = name _unit;
private _carVar = [_veh call BIS_fnc_netId] call BIS_fnc_filterString;
private _vehicleDisplayName = [configFile >> "CfgVehicles" >> typeOf _veh,"displayname","unknown model"] call BIS_fnc_returnConfigEntry;
private _status = [1,0] select _failed;


// [vehicle object, vehicle className, position of theft, date array, status (0 = attempted theft, 1 = theft, 2 = case solved), name of thief, display name of vehicle, plate number, color display name]
GVAR(wantedList) setVariable [_carVar,[_veh,typeOf _veh,_theftPos,date,_status,_thiefName,_vehicleDisplayName,getPlateNumber _veh,_vehColor],true];

private _vehIcon = switch (true) do {
    /* case (_veh isKindOf "Truck_F"): {"iconTruck"}; */    // cant find texture for some reason
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
