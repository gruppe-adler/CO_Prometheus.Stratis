//IDCs =========================================================================
#define PROMETHEUS_MESSAGEZEUS_DIALOG           60140
#define PROMETHEUS_DIALOG_TITLE                 6010
#define PROMETHEUS_DIALOG_CLOSEBUTTON           6030
#define PROMETHEUS_DIALOG_BUTTON1               6100
#define PROMETHEUS_DIALOG_EDITBOX               6400

#define PROMETHEUS_MESSAGEZEUS_TITLE            60150
#define PROMETHEUS_MESSAGEZEUS_TEXT             6110
#define PROMETHEUS_MESSAGEZEUS_TITLEBAR         6120

//COORDS AND DIMENSIONS ========================================================
#define lnButton_textSize   (0.04 * TEXT_SCALE)
#define lnTotal_W           (0.55 * X_SCALE)
#define lnTotal_H           (0.30 * Y_SCALE)
#define lnTotal_X           CENTER(1, lnTotal_W)
#define lnTotal_Y           CENTER(1, lnTotal_H)

#define lnButton_W          (0.100 * X_SCALE)
#define lnButton_H          (0.025 * Y_SCALE)

#define lnSpacing_X         (0.0025 * X_SCALE)
#define lnSpacing_Y         (0.0025 * Y_SCALE)

#define lnCloseButton_W     ((0.025 * X_SCALE) - (2 * lnSpacing_Y))
#define lnCloseButton_H     (lnButton_H - (2 * lnSpacing_X))

#define lnPadding_X         (0.025 * X_SCALE)
#define lnPadding_Y         (1 * lnButton_H)

#define lnBG_X              (lnTotal_X)
#define lnBG_Y              (lnTotal_Y + lnButton_H + lnSpacing_Y)
#define lnBG_H              (lnTotal_H - lnButton_H - lnSpacing_Y)
#define lnTopbar_Y          (lnBG_Y + lnSpacing_Y + lnButton_H)


#define proMZ_X             (0.55 * X_SCALE)
#define proMZ_Y             (0.55 * Y_SCALE)
