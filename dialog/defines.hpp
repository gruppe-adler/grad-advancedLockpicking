#include "ui_toolkit.hpp"

// IDDs, IDCs ==================================================================

#define GRAD_IDD_DIALOG                             56990
#define GRAD_IDC_LISTNBOX                           56991
#define GRAD_IDC_HEADLINEINFOBOX                    56992
#define GRAD_IDC_MAP                                56993
#define GRAD_IDC_HEADLINEMAP                        56994
#define GRAD_IDC_INFOBOXLEFT                        56995
#define GRAD_IDC_INFOBOXRIGHT                       56996
#define GRAD_IDC_INFOBOXPIC                         56997


// DIMENSIONS ==================================================================
// settings
#define GRAD_PADDING_X                  (0.015 * X_SCALE)
#define GRAD_PADDING_Y                  (0.015 * Y_SCALE)

#define GRAD_LISTNBOX_W                 (0.35 * X_SCALE)
#define GRAD_INFOBOX_W                  (0.45 * X_SCALE)
#define GRAD_MAPBOX_W                   (0.60 * X_SCALE)
#define GRAD_CONTENTAREA_H              (0.60 * Y_SCALE)
#define GRAD_HEADLINES_H                (0.025 * Y_SCALE)

#define GRAD_TOPBAR_H                   (0.025 * Y_SCALE)
#define GRAD_SPACER_Y                   (0.0025 * SZ_SCALE)

#define GRAD_LISTNBOX_OFFSET_X          (0.020 * X_SCALE)

// parametric
#define GRAD_LISTNBOX_W_WITH_OFFSET     (GRAD_LISTNBOX_W + GRAD_LISTNBOX_OFFSET_X)

#define GRAD_TOTAL_W                    (GRAD_LISTNBOX_W + GRAD_INFOBOX_W + GRAD_MAPBOX_W + 4 * GRAD_PADDING_X)
#define GRAD_BACKGROUND_H               (GRAD_CONTENTAREA_H + GRAD_HEADLINES_H + GRAD_SPACER_Y + 2 * GRAD_PADDING_Y)
#define GRAD_TOTAL_H                    (GRAD_TOPBAR_H + GRAD_SPACER_Y + GRAD_BACKGROUND_H)

#define GRAD_TOTAL_X                    CENTER(1, GRAD_TOTAL_W)
#define GRAD_TOTAL_Y                    CENTER(1, GRAD_TOTAL_H)

#define GRAD_BACKGROUND_Y               (GRAD_TOTAL_Y + GRAD_TOPBAR_H + GRAD_SPACER_Y)
#define GRAD_HEADLINES_Y                (GRAD_BACKGROUND_Y + GRAD_PADDING_Y)
#define GRAD_CONTENTAREA_Y              (GRAD_HEADLINES_Y + GRAD_HEADLINES_H + GRAD_SPACER_Y)

#define GRAD_LISTNBOX_X                 (GRAD_TOTAL_X + GRAD_PADDING_X)
#define GRAD_LISTNBOX_X_WITH_OFFSET     (GRAD_LISTNBOX_X - GRAD_LISTNBOX_OFFSET_X)
#define GRAD_INFOBOX_X                  (GRAD_LISTNBOX_X + GRAD_LISTNBOX_W + GRAD_PADDING_X)
#define GRAD_MAPBOX_X                   (GRAD_INFOBOX_X + GRAD_INFOBOX_W + GRAD_PADDING_X)

#define GRAD_INFOBOXPIC_W               (GRAD_INFOBOX_W / 3)
#define GRAD_INFOBOXPIC_X               CENTER(GRAD_INFOBOX_W, GRAD_INFOBOXPIC_W)
#define GRAD_INFOBOXPIC_H               (GRAD_CONTENTAREA_H / 2)
#define GRAD_INFOBOXPIC_Y               (GRAD_CONTENTAREA_Y + GRAD_INFOBOXPIC_H)
