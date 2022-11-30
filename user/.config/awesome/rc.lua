-- Imports
local beautiful = require("beautiful")
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME"))) -- Selected theme
require("core.helpers")
require("core.apps")
require("core.layouts")
require("core.bar.bar")
require("core.bindings")
require("core.rules")
require("core.autostart")
