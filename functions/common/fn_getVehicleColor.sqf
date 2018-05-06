#include "script_component.hpp"

params [["_veh",objNull]];

private _return = "unknown color";
if (isNull _veh) exitWith {_return};

private _vehicleTextures = (getObjectTextures _veh) apply {toUpper _x} apply {"\" + _x};
if (count _vehicleTextures == 0) exitWith {_return};

private _textureSourceConfig = configFile >> "CfgVehicles" >> typeOf _veh >> "TextureSources";
diag_log _vehicleTextures;

{
    _colorTextures = ([_x,"textures",[]] call BIS_fnc_returnConfigEntry) apply {toUpper _x};
    if (count (_colorTextures arrayIntersect _vehicleTextures) > 0) exitWith {
        _return = configName _x;
    };
} count ("true" configClasses _textureSourceConfig);

_return
