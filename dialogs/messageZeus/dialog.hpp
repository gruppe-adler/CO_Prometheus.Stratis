#include "defines.hpp"

class prometheus_messageZeus_dialog
{
    idd = PROMETHEUS_MESSAGEZEUS_DIALOG;
    movingEnable = true;
    enableSimulation = true;

    class ControlsBackground
    {
        class MainBackground: prometheus_RscUIBack
        {
            x = lnBG_X;
            y = lnBG_Y;
            w = lnTotal_W;
            h = lnBG_H;
        };

        class TopBar: prometheus_RscUIBack
        {
            text = "NACHRICHT AN ZEUS SCHICKEN";
            idc = PROMETHEUS_DIALOG_TITLE;

            x = lnTotal_X;
            y = lnTotal_Y;
            w = lnTotal_W;
            h = lnButton_H;

            moving = true;
            sizeEx = lnButton_textSize;
            style = ST_LEFT;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",1};
        };
    };

    class Controls
    {
        class CloseButton: prometheus_RscCloseButton
        {
            idc = PROMETHEUS_DIALOG_CLOSEBUTTON;

            x = (lnTotal_X + lnTotal_W) - (lnCloseButton_W + lnSpacing_X);
            y = lnTotal_Y + lnSpacing_Y;
            w = lnCloseButton_W;
            h = lnCloseButton_H;
        };

        class Button1: prometheus_RscButton
        {
            idc = PROMETHEUS_DIALOG_BUTTON1;

            x = (lnTotal_X + lnTotal_W) - (1*lnButton_W + 0*lnSpacing_X);
            y = lnTotal_Y + lnTotal_H + lnSpacing_Y;
            w = lnButton_W;
            h = lnButton_H;

            text = "SENDEN";
            action= "[] call prometheus_ui_fnc_sendZeusMessage;";
        };

        class EditBox: prometheus_RscEditBox
        {
            idc = PROMETHEUS_DIALOG_EDITBOX;
            x = lnTotal_X + lnPadding_X;
            y = lnBG_Y + lnPadding_Y;
            w = lnTotal_W - 2*lnPadding_X;
            h = lnBG_H - 2*lnPadding_Y;
        };
    };
};
