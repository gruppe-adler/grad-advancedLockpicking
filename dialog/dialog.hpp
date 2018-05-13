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

        class TopBar: GVAR(RscText) {
            moving = true;

            onLoad = QUOTE((_this select 0) ctrlSetText GVAR(wantedListTitle));

            x = GRAD_TOTAL_X;
            y = GRAD_TOTAL_Y;
            w = GRAD_TOTAL_W;
            h = GRAD_TOPBAR_H;

            font = "EtelkaMonospacePro";

            colorBackground[] = {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R', 0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",
                1
            };
        };

        class HeadlineListNBox: GVAR(RscBackground) {
            text = "REPORTED THEFTS";
            font = "EtelkaMonospacePro";

            x = GRAD_LISTNBOX_X;
            y = GRAD_HEADLINES_Y;
            w = GRAD_LISTNBOX_W;
            h = GRAD_HEADLINES_H;
        };

        class BackgroundListNBox: GVAR(RscBackground) {
            x = GRAD_LISTNBOX_X;
            y = GRAD_CONTENTAREA_Y;
            w = GRAD_LISTNBOX_W;
            h = GRAD_CONTENTAREA_H;
        };

        class HeadlineInfoBox: GVAR(RscBackground) {
            idc = GRAD_IDC_HEADLINEINFOBOX;

            font = "EtelkaMonospacePro";

            x = GRAD_INFOBOX_X;
            y = GRAD_HEADLINES_Y;
            w = GRAD_INFOBOX_W;
            h = GRAD_HEADLINES_H;
        };

        class BackgroundInfoBox: GVAR(RscBackground) {
            x = GRAD_INFOBOX_X;
            y = GRAD_CONTENTAREA_Y;
            w = GRAD_INFOBOX_W;
            h = GRAD_INFOBOX_H;
        };

        class BackgroundInfoBoxPic: GVAR(RscBackground) {
            x = GRAD_INFOBOX_X;
            y = GRAD_INFOBOXPIC_Y;
            w = GRAD_INFOBOX_W;
            h = GRAD_INFOBOXPIC_H;
        };

        class BackgroundInfoBoxPicText: GVAR(RscStructuredTextLeft) {
            idc = GRAD_IDC_INFOBOXPICTEXT;

            x = GRAD_INFOBOX_X;
            y = GRAD_INFOBOXPIC_Y;
            w = GRAD_INFOBOX_W;
            h = GRAD_INFOBOXPIC_H;
        };

        class HeadlineMap: GVAR(RscBackground) {
            idc = GRAD_IDC_HEADLINEMAP;

            font = "EtelkaMonospacePro";

            x = GRAD_MAPBOX_X;
            y = GRAD_HEADLINES_Y;
            w = GRAD_MAPBOX_W;
            h = GRAD_HEADLINES_H;
        };

        class Map: GVAR(RscMapControl) {
            idc = GRAD_IDC_MAP;

            onMouseButtonUp = QUOTE(_this call FUNC(onMapClick));

            x = GRAD_MAPBOX_X;
            y = GRAD_CONTENTAREA_Y;
            w = GRAD_MAPBOX_W;
            h = GRAD_CONTENTAREA_H;

            onDraw = QUOTE(_this call FUNC(onMapDraw));
        };
    };

    class Controls {
        class ListNBox: GVAR(RscListNBox) {
            idc = GRAD_IDC_LISTNBOX;

            onLBSelChanged = QUOTE(_this call FUNC(onLBSelChanged));

            x = GRAD_LISTNBOX_X_WITH_OFFSET;
            y = GRAD_CONTENTAREA_Y;
            w = GRAD_LISTNBOX_W_WITH_OFFSET;
            h = GRAD_LISTNBOX_H;

            columns[] = {0.04,0.17,0.71};
        };

        class InfoBoxLeft: GVAR(RscStructuredTextLeft) {
            idc = GRAD_IDC_INFOBOXLEFT;

            x = GRAD_INFOBOX_X;
            y = GRAD_CONTENTAREA_Y;
            w = GRAD_INFOBOX_W;
            h = GRAD_INFOBOX_H;
        };

        class InfoBoxRight: InfoBoxLeft {
            idc = GRAD_IDC_INFOBOXRIGHT;

            x = GRAD_INFOBOX_X + (GRAD_INFOBOX_W / 2);
            y = GRAD_CONTENTAREA_Y;
            w = (GRAD_INFOBOX_W / 2);
            h = GRAD_INFOBOX_H;
        };

        class InfoBoxPic: GVAR(RscPicture) {
            idc = GRAD_IDC_INFOBOXPIC;

            x = GRAD_INFOBOXPIC_X;
            y = GRAD_INFOBOXPIC_Y;
            w = GRAD_INFOBOXPIC_W;
            h = GRAD_INFOBOXPIC_H;
        };

        class SolvedButton: GVAR(RscButton) {
            idc = GRAD_IDC_SOLVEDBUTTON;

            text = "MARK AS SOLVED";
            font = "EtelkaMonospacePro";

            x = GRAD_SOLVEDBUTTON_X;
            y = GRAD_SOLVEDBUTTON_Y;
            w = GRAD_SOLVEDBUTTON_W;
            h = GRAD_SOLVEDBUTTON_H;

            colorBackground[] = {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R', 0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",
                1
            };

            onLoad = QUOTE((_this select 0) ctrlEnable false);
            onButtonClick = QUOTE(_this call FUNC(onSolvedButton));
        };
    };
};
