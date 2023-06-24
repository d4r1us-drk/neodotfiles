-- imports
local beautiful = require("beautiful")
beautiful.init(string.format("%s/.config/awesome/ui/theme.lua", os.getenv("HOME"))) -- selected theme
require("helpers")                                                                  -- some aditional code for handling
require("apps")                                                                     -- selected apps & scripts
require("ui.layouts")                                                               -- predifined tiling layouts
require("ui.bar")                                                                   -- the bar on the top
require("ui.notif")                                                                 -- the notification manager
require("keymaps.keyboard")                                                         -- keyboard shortcuts
require("keymaps.mouse")                                                            -- mouse shortcuts
require("ui.rules")                                                                 -- window manager rules
require("autostart")                                                                -- startup applications
