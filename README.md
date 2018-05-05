# GRAD Advanced Lockpicking
dummy text

## Dependencies
* [CBA_A3](https://github.com/CBATeam/CBA_A3)
* [ACE3](https://github.com/acemod/ACE3)

## Credits
Credits go to PabstMirror and the ACE Team. This script module builds upon ACE's vehiclelock component and uses some of its code.

## Usage

### Variables

**grad_advancedLockpicking_defaultLockpickStrength**  
Default lockpick strength of all vehicle locks. Default value: 1.

**grad_advancedLockpicking_lockpickStrength**  
Sets lockpick strength of vehicle. -1 means vehicle is not lockpickable. Higher means lockpicking takes longer and is more likely to fail.

```sqf
_vehicle setVariable ["grad_advancedLockpicking_lockpickStrength",1];
```
