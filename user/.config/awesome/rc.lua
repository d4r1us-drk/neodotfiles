-- imports
local beautiful = require("beautiful")
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME"))) -- selected theme
require("core.autostart")   -- startup applications
require("core.signals")     -- some aditional code for signals & error handling
require("core.rules")       -- window manager rules
require("config.keys")      -- keyboard shortcuts
require("ui.layouts")       -- predifined tiling layouts
require("ui.bar")           -- the bar on the top
require("ui.notif")         -- the notification manager
