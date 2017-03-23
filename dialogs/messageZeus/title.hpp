#include "defines.hpp"

class prometheus_messageZeus_title {
    idd = PROMETHEUS_MESSAGEZEUS_TITLE;
    duration = 10;

    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['prometheus_messageZeus_title', _this select 0];";
    onUnload = "uiNamespace setVariable ['prometheus_messageZeus_title', displayNull];";

    class ControlsBackground {
        class Background: prometheus_RscUIBack {
            idc = -1;

            x = proMZ_X;
            y = proMZ_Y;
            w = lnTotal_W*0.7;
            h = lnBG_H*0.7;
        };

        class TopBar: prometheus_RscUIBack
        {
            text = "NACHRICHT VON UNBEKANNT";
            idc = PROMETHEUS_MESSAGEZEUS_TITLEBAR;

            x = proMZ_X;
            y = proMZ_Y - lnSpacing_Y - lnButton_H;
            w = lnTotal_W*0.7;
            h = lnButton_H;

            moving = true;
            sizeEx = lnButton_textSize;
            style = ST_LEFT;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",1};
        };

        class Text: prometheus_RscStructuredText {
            idc = PROMETHEUS_MESSAGEZEUS_TEXT;

            x = proMZ_X + 0.5*lnPadding_X;
            y = proMZ_Y + 0.5*lnPadding_Y;
            w = lnTotal_W*0.7 - lnPadding_X;
            h = lnBG_H*0.7 - lnPadding_Y;
        };
    };
};
