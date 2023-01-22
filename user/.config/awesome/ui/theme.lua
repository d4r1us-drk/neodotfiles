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
theme.bar_bg_one = "#cc241d"
theme.bar_bg_two = "#d79921"
theme.bar_bg_tre = "#98971a"
theme.bar_bg_for = "#458588"
theme.bar_bg_fiv = "#b16286"
theme.bar_clock  = "#928374"
--- }}}

-- {{{ Colors
theme.fg_normal  = "#282828"
theme.fg_focus   = "#fbf1c7"
theme.fg_urgent  = "#fb4934"
theme.bg_normal  = "#1d2021"
theme.bg_focus   = "#3c3836"
theme.bg_urgent  = "#504945"
-- }}}

-- {{{ Borders
beautiful.gap_single_client = false
theme.useless_gap           = dpi(0)
theme.border_width          = dpi(0.5)
theme.border_normal         = "#504945"
theme.border_focus          = "#cc241d"
theme.border_marked         = "#cc241d"
-- }}}

-- {{{ Taglist
theme.taglist_font          = "mononoki Nerd Font Mono 28"
theme.taglist_bg            = "#3c3836"
theme.taglist_fg_focus      = "#fb4934"
theme.taglist_fg_occupied   = "#689d6a"
theme.taglist_fg_urgent     = "#cc241d"
theme.taglist_fg_empty      = "#928374"
theme.taglist_spacing       = 5
-- }}}

-- {{{ Notifications
theme.notification_font     = "mononoki Nerd Font 12"
theme.notification_bg       = "#1d2021"
theme.notification_bg_alt   = "#282828"
theme.notification_fg       = "#ebdbb2"
theme.notification_fg_alt   = "#282828"
theme.notification_critical = "#fb4934"
theme.notification_shape    = gears.shape.rounded_rect
-- }}}

-- {{{ Hotkeys Popup
theme.hotkeys_bg                = "#1d2021"
theme.hotkeys_fg                = "#ebdbb2"
theme.hotkeys_modifiers_fg      = "#458588"
theme.hotkeys_label_bg          = "#d79921"
theme.hotkeys_label_fg          = "#1d2021"
theme.hotkeys_group_margin      = dpi(20)
theme.hotkeys_description_font  = "mononoki Nerd Font 12"
theme.hotkeys_font              = "mononoki Nerd Font 12"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color    = "#fb4934"
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
