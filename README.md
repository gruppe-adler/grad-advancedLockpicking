# GRAD Advanced Lockpicking
dummy text

## Dependencies
* [CBA_A3](https://github.com/CBATeam/CBA_A3)
* [ACE3](https://github.com/acemod/ACE3)

## Credits
Credits go to PabstMirror and the ACE Team. This script module builds upon ACE's vehiclelock component and uses some of its code.

## Usage

### Variables
All variables have the prefix *grad_advancedLockpicking*.

**(unit namespace) canLockpick**  
Allows a unit to lockpick even when *canLockpickDefault* is set to false.

```sqf
_unit setVariable ["grad_advancedLockpicking_canLockpick",true];
```

**(unit namespace) isSpecialist**  
Sets a unit to specialist who uses *specialistTimeFactor* and *specialistSuccessFactor*.

```sqf
_unit setVariable ["grad_advancedLockpicking_isSpecialist",true];
```

**(vehicle namespace) baseLockpickTime**  
Sets base lockpicking time value in seconds for specific vehicle. Overrides *baseLockpickTimeDefault*. Type based time factors (car, boat, ...) no longer apply.

```sqf
_vehicle setVariable ["grad_advancedLockpicking_baseLockpickTime",20];
```

**(vehicle namespace) baseSuccessProbability**  
Sets base success probability value in percent for specific vehicle. Overrides *baseSuccessProbabilityDefault*. Type based success factors (car, boat, ...) no longer apply.

```sqf
_vehicle setVariable ["grad_advancedLockpicking_baseSuccessProbability",50];
```

**(vehicle namespace) alarmOnSuccessProbability**  
Sets base alarm probability value in percent for specific vehicle. Overrides *alarmOnSuccessProbabilityDefault*.

```sqf
_vehicle setVariable ["grad_advancedLockpicking_alarmOnSuccessProbability",80];
```

**(vehicle namespace) wantedListOnSuccessProbability**  
Sets adding to wanted list on success probability value in percent for specific vehicle. Overrides *wantedListOnSuccessProbabilityDefault*.

```sqf
_vehicle setVariable ["grad_advancedLockpicking_alarmOnSuccessProbability",80];
```
