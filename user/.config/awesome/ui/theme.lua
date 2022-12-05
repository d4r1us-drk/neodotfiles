-- {{{ Imports
local gears = require("gears")
local gcolor = require("gears.color")
local dpi = require("beautiful.xresources").apply_dpi
local beautiful = require("beautiful")
-- }}}

local themes_path = string.format("%s/.config/awesome/ui/", os.getenv("HOME"))

-- {{{ Main
local theme = {}
-- }}}

-- {{{ theme font
theme.font  = "mononoki Nerd Font 12"
--- }}}

-- {{{ bar colors
theme.bar_bg_one = "#9ece6a"
theme.bar_bg_two = "#ff9e64"
theme.bar_bg_tre = "#f7768e"
theme.bar_bg_for = "#7aa2f7"
theme.bar_bg_fiv = "#bb9af7"
theme.bar_clock  = "#a9b1d6"
--- }}}

-- {{{ Colors
theme.fg_normal  = "#1a1b26"
theme.fg_focus   = "#a9b1d6"
theme.fg_urgent  = "#c0caf5"
theme.bg_normal  = "#1a1b26"
theme.bg_focus   = "#363b54"
theme.bg_urgent  = "#787c99"
-- }}}

-- {{{ Borders
beautiful.gap_single_client = false
theme.useless_gap           = dpi(0)
theme.border_width          = dpi(1)
theme.border_normal         = "#363b54"
theme.border_focus          = "#7aa2f7"
theme.border_marked         = "#7aa2f7"
-- }}}

-- {{{ Taglist
theme.taglist_font          = "mononoki Nerd Font Mono 22"
theme.taglist_fg_focus      = "#f7768e"
theme.taglist_fg_occupied   = "#c0caf5"
theme.taglist_fg_urgent     = "#bb9af7"
theme.taglist_fg_empty      = "#565f89"
theme.taglist_spacing       = 5
-- }}}

-- {{{ Notifications
theme.notification_font     = "mononoki Nerd Font 12"
theme.notification_bg       = "#1a1b26"
theme.notification_fg       = "#c0caf5"
theme.notification_shape    = gears.shape.rounded_rect
-- }}}

-- {{{ Hotkeys Popup
theme.hotkeys_bg                = "#1a1b26"
theme.hotkeys_fg                = "#a9b1d6"
theme.hotkeys_modifiers_fg      = "#41a6b5"
theme.hotkeys_label_bg          = "#e0af68"
theme.hotkeys_label_fg          = "#1a1b26"
theme.hotkeys_group_margin      = dpi(20)
theme.hotkeys_description_font  = "mononoki Nerd Font 12"
theme.hotkeys_font              = "mononoki Nerd Font 12"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color    = "#f7768e"
theme.mouse_finder_radius   = dpi(5)
theme.mouse_finder_timeout  = 10
-- }}}

-- {{{ Layout
theme.layout_tile       = gcolor.recolor_image(themes_path .. "layout-icons/tilew.png", theme.fg_urgent)
theme.layout_centerwork = gcolor.recolor_image(themes_path .. "layout-icons/centerworkw.png", theme.fg_urgent)
theme.layout_tileleft   = gcolor.recolor_image(themes_path .. "layout-icons/tileleftw.png", theme.fg_urgent)
theme.layout_tilebottom = gcolor.recolor_image(themes_path .. "layout-icons/tilebottomw.png", theme.fg_urgent)
theme.layout_tiletop    = gcolor.recolor_image(themes_path .. "layout-icons/tiletopw.png", theme.fg_urgent)
theme.layout_fairv      = gcolor.recolor_image(themes_path .. "layout-icons/fairvw.png", theme.fg_urgent)
theme.layout_fairh      = gcolor.recolor_image(themes_path .. "layout-icons/fairhw.png", theme.fg_urgent)
theme.layout_spiral     = gcolor.recolor_image(themes_path .. "layout-icons/spiralw.png", theme.fg_urgent)
theme.layout_dwindle    = gcolor.recolor_image(themes_path .. "layout-icons/dwindlew.png", theme.fg_urgent)
theme.layout_max        = gcolor.recolor_image(themes_path .. "layout-icons/maxw.png", theme.fg_urgent)
theme.layout_fullscreen = gcolor.recolor_image(themes_path .. "layout-icons/fullscreenw.png", theme.fg_urgent)
theme.layout_magnifier  = gcolor.recolor_image(themes_path .. "layout-icons/magnifierw.png", theme.fg_urgent)
theme.layout_floating   = gcolor.recolor_image(themes_path .. "layout-icons/floatingw.png", theme.fg_urgent)
theme.layout_cornernw   = gcolor.recolor_image(themes_path .. "layout-icons/cornernw.png", theme.fg_urgent)
theme.layout_cornerne   = gcolor.recolor_image(themes_path .. "layout-icons/cornerne.png", theme.fg_urgent)
theme.layout_cornersw   = gcolor.recolor_image(themes_path .. "layout-icons/cornersw.png", theme.fg_urgent)
theme.layout_cornerse   = gcolor.recolor_image(themes_path .. "layout-icons/cornerse.png", theme.fg_urgent)
-- }}}

return theme
