local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

-- Create a textbox widget
local keyboard_layout_widget = wibox.widget.textbox()

-- Function to update the layout value
local function update_keyboard_layout_widget()
    awful.spawn.easy_async_with_shell("setxkbmap -query | grep -oP 'layout:\\s*\\K\\w+'", function(stdout)
        local layout = stdout:gsub("\n", "")
        keyboard_layout_widget:set_markup("󰌌 " .. layout:upper())
    end)
end

-- Update the widget initially
update_keyboard_layout_widget()

-- Refresh the widget every 10 seconds
local timer = gears.timer.start_new(10, function()
    update_keyboard_layout_widget()
    return true
end)

return keyboard_layout_widget
