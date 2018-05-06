#include "script_component.hpp"

params [["_veh",objNull],["_duration",15]];

private _logicCenter = createCenter sideLogic;
private _gameLogic = (createGroup _logicCenter) createUnit ["Logic",[0,0,0],[],0,"NONE"];

// lights and horn
[{
    params ["_args","_handle"];
    _args params ["_veh","_duration","_startTime","_gameLogic","_lightStatus","_originalLightStatus"];

    if (CBA_missionTime - _startTime > _duration || !alive _veh) exitWith {
        _gameLogic action [["LightOff","LightOn"] select _originalLightStatus,_veh];
        deleteVehicle _gameLogic;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _gameLogic action ["useWeapon",_veh,driver _veh,0];
    _gameLogic action [["LightOff","LightOn"] select _lightStatus,_veh];
    _args set [4,!_lightStatus];

},0.3,[_veh,_duration,CBA_missionTime,_gameLogic,true,isLIghtOn _veh]] call CBA_fnc_addPerFrameHandler;
