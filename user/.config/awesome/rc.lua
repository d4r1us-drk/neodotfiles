-- Imports
local beautiful = require("beautiful")
beautiful.init(string.format("%s/.config/awesome/ui/theme.lua", os.getenv("HOME"))) -- Selected theme
require("helpers")
require("apps")
require("ui.layouts")
require("ui.bar")
require("keymaps.keyboard")
require("keymaps.mouse")
require("ui.rules")
require("autostart")
