#include "ui_toolkit.hpp"

// IDDs, IDCs ==================================================================

#define GRAD_IDD_DIALOG                             56990



// DIMENSIONS ==================================================================
// settings
#define GRAD_PADDING_X                  (0.025 * X_SCALE)
#define GRAD_PADDING_Y                  (0.025 * Y_SCALE)

#define GRAD_LISTBOX_W                  (0.35 * X_SCALE)
#define GRAD_INFOBOX_W                  (0.45 * X_SCALE)
#define GRAD_MAPBOX_W                   (0.60 * X_SCALE)
#define GRAD_CONTENTAREA_H              (0.60 * Y_SCALE)

#define GRAD_TOPBAR_H                   (0.025 * Y_SCALE)
#define GRAD_SPACER_Y                   (0.0025 * SZ_SCALE)

// parametric
#define GRAD_TOTAL_W                    (GRAD_LISTBOX_W + GRAD_INFOBOX_W + GRAD_MAPBOX_W + 4 * GRAD_PADDING_X)
#define GRAD_BACKGROUND_H               (GRAD_CONTENTAREA_H + 2 * GRAD_PADDING_Y)
#define GRAD_TOTAL_H                    (GRAD_TOPBAR_H + GRAD_SPACER_Y + GRAD_BACKGROUND_H)

#define GRAD_TOTAL_X                    CENTER(1, GRAD_TOTAL_W)
#define GRAD_TOTAL_Y                    CENTER(1, GRAD_TOTAL_H)

#define GRAD_BACKGROUND_Y               (GRAD_TOTAL_Y + GRAD_TOPBAR_H + GRAD_SPACER_Y)
#define GRAD_CONTENTAREA_Y              (GRAD_BACKGROUND_Y + GRAD_PADDING_Y)

#define GRAD_LISTBOX_X                  (GRAD_TOTAL_X + GRAD_PADDING_X)
#define GRAD_INFOBOX_X                  (GRAD_LISTBOX_X + GRAD_LISTBOX_W + GRAD_PADDING_X)
#define GRAD_MAPBOX_X                   (GRAD_INFOBOX_X + GRAD_INFOBOX_W + GRAD_PADDING_X)
