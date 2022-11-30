-- {{{ Imports
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi
local beautiful = require("beautiful")
-- }}}

local themes_path = string.format("%s/.config/awesome/theme/", os.getenv("HOME"))

-- {{{ Main
local theme = {}
-- }}}

-- {{{ theme font
theme.font          = "mononoki Nerd Font 12"
--- }}}

-- {{{ bar colors
theme.bar_bg_one = "#427b58"
theme.bar_bg_two = "#b57614"
theme.bar_bg_tre = "#9d0006"
theme.bar_bg_for = "#076678"
theme.bar_bg_fiv = "#8f3f71"
theme.bar_clock  = "#3c3836"
--- }}}

-- {{{ Colors
theme.fg_normal  = "#ebdbb2"
theme.fg_focus   = "#dfc4a1"
theme.fg_urgent  = "#fbf1c7"
theme.bg_normal  = "#1d2021"
theme.bg_focus   = "#3c3836"
theme.bg_urgent  = "#a89984"
-- }}}

-- {{{ Borders
beautiful.gap_single_client = false
theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#504945"
theme.border_focus  = "#9d0006"
theme.border_marked = "#9d0006"
-- }}}

-- {{{ Taglist
theme.taglist_font          = "mononoki Nerd Font Mono 24"
theme.taglist_fg_focus      = "#fb4934"
theme.taglist_fg_occupied   = "#8ec07c"
theme.taglist_fg_urgent     = "#504945"
theme.taglist_fg_empty      = "#a89984"
theme.taglist_spacing       = 5
-- }}}

-- {{{ Notifications
theme.notification_font     = "mononoki Nerd Font Mono 12"
theme.notification_bg       = "#282828"
theme.notification_fg       = "#fbf1c7"
theme.notification_shape    = gears.shape.rounded_rect
-- }}}

-- {{{ Hotkeys Popup
theme.hotkeys_bg    = "#282828"
theme.hotkeys_fg    = "#ebdbb2"
theme.hotkeys_modifiers_fg  = "#458588"
theme.hotkeys_label_bg      = "#fabd2f"
theme.hotkeys_label_fg      = "#1d2021"
theme.hotkeys_group_margin  = dpi(20)
theme.hotkeys_description_font  = "mononoki Nerd Font Mono 12"
theme.hotkeys_font              = "mononoki Nerd Font Mono 12"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color    = "#cc241d"
theme.mouse_finder_radius   = dpi(5)
theme.mouse_finder_timeout  = 10
-- }}}

-- {{{ Layout
theme.layout_tile       = themes_path .. "layouts/tile.png"
theme.layout_tileleft   = themes_path .. "layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "layouts/tilebottom.png"
theme.layout_tiletop    = themes_path .. "layouts/tiletop.png"
theme.layout_fairv      = themes_path .. "layouts/fairv.png"
theme.layout_fairh      = themes_path .. "layouts/fairh.png"
theme.layout_spiral     = themes_path .. "layouts/spiral.png"
theme.layout_dwindle    = themes_path .. "layouts/dwindle.png"
theme.layout_max        = themes_path .. "layouts/max.png"
theme.layout_fullscreen = themes_path .. "layouts/fullscreen.png"
theme.layout_magnifier  = themes_path .. "layouts/magnifier.png"
theme.layout_floating   = themes_path .. "layouts/floating.png"
theme.layout_cornernw   = themes_path .. "layouts/cornernw.png"
theme.layout_cornerne   = themes_path .. "layouts/cornerne.png"
theme.layout_cornersw   = themes_path .. "layouts/cornersw.png"
theme.layout_cornerse   = themes_path .. "layouts/cornerse.png"
-- }}}

return theme
