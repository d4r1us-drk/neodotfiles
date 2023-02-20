-- Imports
local beautiful = require("beautiful")
beautiful.init(string.format("%s/.config/awesome/ui/theme.lua", os.getenv("HOME"))) -- Selected theme
require("helpers") -- Some aditional code for handling
require("apps") -- Selected apps & scripts
require("ui.layouts") -- Predifined tiling layouts
require("ui.bar") -- The bar on the top
require("ui.notif") -- The notification manager
require("keymaps.keyboard") -- Keyboard shortcuts
require("keymaps.mouse") -- Mouse shortcuts
require("ui.rules") -- Window manager rules
require("autostart") -- Startup applications
