local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

-- Create a textbox widget
local brightness_widget = wibox.widget.textbox()

-- Function to update the brightness value
local function update_brightness()
    awful.spawn.easy_async_with_shell("brightnessctl -m | awk -F, '{print substr($4, 0, length($4)-1)}'", function(stdout)
        local brightness = stdout:gsub("\n", "")
        local icon

        if tonumber(brightness) == 100 then
            icon = "󰛨"
        elseif tonumber(brightness) >= 90 then
            icon = "󱩖"
        elseif tonumber(brightness) >= 80 then
            icon = "󱩕"
        elseif tonumber(brightness) >= 70 then
            icon = "󱩔"
        elseif tonumber(brightness) >= 60 then
            icon = "󱩓"
        elseif tonumber(brightness) >= 50 then
            icon = "󱩒"
        elseif tonumber(brightness) >= 40 then
            icon = "󱩑"
        elseif tonumber(brightness) >= 30 then
            icon = "󱩐"
        elseif tonumber(brightness) >= 20 then
            icon = "󱩏"
        else
            icon = "󱩎"
        end

        brightness_widget:set_markup(icon .. " " .. math.floor(tonumber(brightness)) .. "%")
    end)
end

-- Update the brightness initially
update_brightness()

-- Refresh the widget every 5 seconds
local timer = gears.timer.start_new(5, function()
    update_brightness()
    return true
end)

return brightness_widget
