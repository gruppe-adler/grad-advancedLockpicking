#include "script_component.hpp"

#include "baseDefines.hpp"
#include "defines.hpp"

#include "ui_toolkit.hpp"
#include "baseRsc.hpp"


class GVAR(DisplayWantedList) {
    idd = GRAD_IDD_DIALOG;
    movingEnable = true;
    enableSimulation = true;
    onLoad = QUOTE(_this call FUNC(updateDialog));

    class ControlsBackground {
        class MainBackground: GVAR(RscBackground) {
            x = GRAD_TOTAL_X;
            y = GRAD_BACKGROUND_Y;
            w = GRAD_TOTAL_W;
            h = GRAD_BACKGROUND_H;
        };

        class TopBar: GVAR(RscBackground) {
            moving = true;

            x = GRAD_TOTAL_X;
            y = GRAD_TOTAL_Y;
            w = GRAD_TOTAL_W;
            h = GRAD_TOPBAR_H;

            colorBackground[] = {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R', 0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",
                1
            };
        };

        class Map: GVAR(RscMapControl) {
            x = GRAD_MAPBOX_X;
            y = GRAD_CONTENTAREA_Y;
            w = GRAD_MAPBOX_W;
            h = GRAD_CONTENTAREA_H;

            onDraw = QUOTE(_this call FUNC(onMapDraw));
        };
    };

    class Controls {
        class ListBox: GVAR(RscListBox) {
            x = GRAD_LISTBOX_X;
            y = GRAD_CONTENTAREA_Y;
            w = GRAD_LISTBOX_W;
            h = GRAD_CONTENTAREA_H;
        };
    };
};
