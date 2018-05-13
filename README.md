# GRAD Advanced Lockpicking
An continuation of ACE-vehiclelock's lockpicking functionality in a modular package for your mission. Adds possibility for lockpicking to fail and trigger an alarm. Gives player (e.g. "Police" faction) a wanted list dialog listing all reported vehicle thefts. Comes with more detailed configurability.

## Dependencies
* [CBA_A3](https://github.com/CBATeam/CBA_A3)
* [ACE3](https://github.com/acemod/ACE3)

## Credits
Credits go to PabstMirror and the ACE Team. This script module builds upon ACE's vehiclelock component and uses some of its code.

## Usage
Interact with a locked vehicle like you would with ACE. Select *unlock vehicle* action and wait for the progress bar to complete. Your progress may fail at any time and trigger the vehicle's alarm. Specialists will have a higher chance of success. Different vehicle types will be harder to lockpick.

Players that have been configured the ability to open the *wanted list* will get a notification whenever a vehicle theft has been reported. They may open the *wanted list* dialog with *ACE-Selfinteraction >> Equipment >> Wanted List*. When selecting a vehicle from the list on the left, additional info will be displayed in the middle of the dialog. The map on the right will move to the selected vehicle. This works backwards as well by selecting a vehicle from the map.

By hitting the *Mark as Solved* button, the case will be marked as solved globally (for all players). The name of the unit who closed the case will be added to the case's info text.

## Installation
Add the following lines to your `description.ext`. Use `#define MODULES_DIRECTORY <your path>` if you want to use your own folder structure instead of the `node_modules` folder.

```sqf
#include "node_modules\grad-advancedLockpicking\grad_advancedLockpicking.hpp"

class CfgFunctions {
    #include "node_modules\grad-advancedLockpicking\cfgFunctions.hpp"
};

class CfgNotifications {
    #include "node_modules\grad-advancedLockpicking\cfgNotifications.hpp"
};
```

### Via `npm`
_for details about what npm is and how to use it, look it up on [npmjs.com](https://www.npmjs.com/)_

Install package `grad-advancedLockpicking` : `npm install --save grad-advancedLockpicking`.

### Manually
Download the latest release from the [releases page](https://github.com/gruppe-adler/grad-advancedLockpicking/releases). Place the `grad-advancedLockpicking` folder in your mission's root folder.

## Configuration
You can optionally configure `grad-advancedLockpicking` to your liking by adding the following config to your `description.ext`. The values listed here are the default value.

Every config entry has a correspoding global variable that can be set in a running mission at any point after `preInit`. All variables have the prefix `grad_advancedLockpicking_`. E.g. if I wanted to allow a single unit to lockpick tanks, I would change the variable `grad_advancedLockpicking_canPickTank` on his machine to `1`.

```sqf
class CfgGradAdvancedLockpicking {
    canLockpickDefault = 1;                         // can all units lockpick by default? 0/1
    needLockpickSet = 1;                            // do units need ACE's lockpick set item in inventory to be able to pick locks? 0/1

    canUseWantedListCondition = "true";             // condition for ability to use the wantedList; passed params are [unit]; condition and sides are logically connected by OR
    canUseWantedListSides[] = {};                   // sides that can use the wanted list by default; e.g. {"WEST","EAST","INDEPENDENT","CIVILIAN"}; condition and sides are logically connected by OR
    wantedListTitle = "GRAD-advancedLockpicking";   // title of wantedList dialog; e.g. "Tanoa Police Theft Tracker"

    baseLockpickTimeDefault = 10;                   // base time in seconds for picking locks; time factors are applied to this; -1 to make locks unpickable
    baseSuccessProbabilityDefault = 75;             // base probability in percent for successfully picking locks; success factors are applied to this

    alarmOnSuccessProbabilityDefault = 10;          // probability in percent for vehicle alarm to trigger even when lockpicking was successful; -1 to disable
    wantedListOnSuccessProbabilityDefault = 50;     // probability in percent for theft to be added to wanted list even when lockpicking was successful; -1 to disable

    wantedListDelayOnFailure[] = {0,0};             // min and max delay in seconds for failed thefts to be added to wanted list
    wantedListDelayOnSuccess[] = {10,60};           // min and max delay in seconds for successful thefts to be added to wanted list

    suspectNameProbabilityOnAlarm = 10;             // probability in percent for thief's name to be added to wanted list if vehicle alarm was triggered
    suspectNameProbabilityOnNoAlarm = 1;            // probability in percent for thief's name to be added to wanted list if vehicle alarm was not triggered

    plateNumberProbability = 90;                    // probability for plate number to be added to wanted list

    alarmDurationMinMax[] = {10,30};                // min and max duration in seconds for alarm

    specialistTimeFactor = 0.7;                     // time factor for specialists, lower means faster
    specialistSuccessFactor = 1.5;                  // probability factor for success for specialists

    canPickCar = 1;                                 // make car locks pickable; 0/1
    carTimeFactor = 1;                              // time factor for picking car locks, higher means lockpicking takes longer
    carSuccessFactor = 1;                           // probability factor for successfully picking car locks, higher means more likely to succeed

    canPickMotorcycle = 1;
    motorcycleTimeFactor = 0.7;
    motorcycleSuccessFactor = 1.5;

    canPickBoat = 1;
    boatTimeFactor = 1;
    boatSuccessFactor = 1;

    canPickTank = 0;
    tankTimeFactor = 5;
    tankSuccessFactor = 0.5;

    canPickHelicopter = 0;
    helicopterTimeFactor = 2;
    helicopterSuccessFactor = 0.9;

    canPickPlane = 0;
    planeTimeFactor = 3;
    planeSuccessFactor = 0.7;
};
```


### Object Variables
Additionally to the aforementioned global settings, there are some variables that you can set on objects to configure how they interact with this module. All variables have the prefix *grad_advancedLockpicking*.

#### (unit namespace) canLockpick
Allows a unit to lockpick even when *canLockpickDefault* is set to false.

```sqf
_unit setVariable ["grad_advancedLockpicking_canLockpick",true];
```

#### (unit namespace) isSpecialist
Sets a unit to specialist who uses *specialistTimeFactor* and *specialistSuccessFactor*.

```sqf
_unit setVariable ["grad_advancedLockpicking_isSpecialist",true];
```

#### (vehicle namespace) baseLockpickTime
Sets base lockpicking time value in seconds for specific vehicle. Overrides *baseLockpickTimeDefault*. Type based time factors (car, boat, ...) no longer apply.

```sqf
_vehicle setVariable ["grad_advancedLockpicking_baseLockpickTime",20];
```

#### (vehicle namespace) baseSuccessProbability
Sets base success probability value in percent for specific vehicle. Overrides *baseSuccessProbabilityDefault*. Type based success factors (car, boat, ...) no longer apply.

```sqf
_vehicle setVariable ["grad_advancedLockpicking_baseSuccessProbability",50];
```

#### (vehicle namespace) alarmOnSuccessProbability
Sets base alarm probability value in percent for specific vehicle. Overrides *alarmOnSuccessProbabilityDefault*.

```sqf
_vehicle setVariable ["grad_advancedLockpicking_alarmOnSuccessProbability",80];
```

#### (vehicle namespace) wantedListOnSuccessProbability
Sets adding to wanted list on success probability value in percent for specific vehicle. Overrides *wantedListOnSuccessProbabilityDefault*.

```sqf
_vehicle setVariable ["grad_advancedLockpicking_alarmOnSuccessProbability",80];
```
