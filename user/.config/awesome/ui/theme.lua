-- {{{ Imports
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi
local beautiful = require("beautiful")
-- }}}

local themes_path = string.format("%s/.config/awesome/ui/", os.getenv("HOME"))

-- {{{ Main
local theme = {}
-- }}}

-- {{{ theme font
theme.font  = "mononoki Nerd Font 13"
--- }}}

-- {{{ bar colors
theme.bar_bg_one = "#f7768e"
theme.bar_bg_two = "#e0af68"
theme.bar_bg_tre = "#9ece6a"
theme.bar_bg_for = "#7aa2f7"
theme.bar_bg_fiv = "#bb9af7"
theme.bar_clock  = "#9aa5ce"
--- }}}

-- {{{ Colors
theme.fg_normal  = "#243b26"
theme.fg_focus   = "#a9b1d6"
theme.fg_urgent  = "#c0caf5"
theme.bg_normal  = "#1a1b26"
theme.bg_focus   = "#24283b"
theme.bg_urgent  = "#24283b"
-- }}}

-- {{{ Borders
beautiful.gap_single_client = false
theme.useless_gap           = dpi(0)
theme.border_width          = dpi(0.5)
theme.border_normal         = "#363b58"
theme.border_focus          = "#7aa2f7"
theme.border_marked         = "#7aa2f7"
-- }}}

-- {{{ Taglist
theme.taglist_font          = "mononoki Nerd Font Mono 28"
theme.taglist_bg            = "#24283b"
theme.taglist_fg_focus      = "#d5d6db"
theme.taglist_fg_occupied   = "#9aa5ce"
theme.taglist_fg_urgent     = "#f7758e"
theme.taglist_fg_empty      = "#565f89"
theme.taglist_spacing       = 5
-- }}}

-- {{{ Notifications
theme.notification_font     = "mononoki Nerd Font 12"
theme.notification_bg       = "#24283b"
theme.notification_bg_alt   = "#414868"
theme.notification_fg       = "#c0caf5"
theme.notification_fg_alt   = "#1a1b26"
theme.notification_critical = "#f7768e"
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

-- {{{ Layout Icons
theme.layout_tile       = gears.color.recolor_image(themes_path .. "icons/tilew.png", theme.fg_urgent)
theme.layout_centerwork = gears.color.recolor_image(themes_path .. "icons/centerworkw.png", theme.fg_urgent)
theme.layout_tileleft   = gears.color.recolor_image(themes_path .. "icons/tileleftw.png", theme.fg_urgent)
theme.layout_tilebottom = gears.color.recolor_image(themes_path .. "icons/tilebottomw.png", theme.fg_urgent)
theme.layout_tiletop    = gears.color.recolor_image(themes_path .. "icons/tiletopw.png", theme.fg_urgent)
theme.layout_fairv      = gears.color.recolor_image(themes_path .. "icons/fairvw.png", theme.fg_urgent)
theme.layout_fairh      = gears.color.recolor_image(themes_path .. "icons/fairhw.png", theme.fg_urgent)
theme.layout_spiral     = gears.color.recolor_image(themes_path .. "icons/spiralw.png", theme.fg_urgent)
theme.layout_dwindle    = gears.color.recolor_image(themes_path .. "icons/dwindlew.png", theme.fg_urgent)
theme.layout_max        = gears.color.recolor_image(themes_path .. "icons/maxw.png", theme.fg_urgent)
theme.layout_fullscreen = gears.color.recolor_image(themes_path .. "icons/fullscreenw.png", theme.fg_urgent)
theme.layout_magnifier  = gears.color.recolor_image(themes_path .. "icons/magnifierw.png", theme.fg_urgent)
theme.layout_floating   = gears.color.recolor_image(themes_path .. "icons/floatingw.png", theme.fg_urgent)
theme.layout_cornernw   = gears.color.recolor_image(themes_path .. "icons/cornernw.png", theme.fg_urgent)
theme.layout_cornerne   = gears.color.recolor_image(themes_path .. "icons/cornerne.png", theme.fg_urgent)
theme.layout_cornersw   = gears.color.recolor_image(themes_path .. "icons/cornersw.png", theme.fg_urgent)
theme.layout_cornerse   = gears.color.recolor_image(themes_path .. "icons/cornerse.png", theme.fg_urgent)
-- }}}

return theme
