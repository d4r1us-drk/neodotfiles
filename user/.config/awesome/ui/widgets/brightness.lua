local wibox = require("wibox")
local awful = require("awful")

-- Create a textbox widget
local brightness_text = wibox.widget.textbox()

-- Function to update the brightness value
local function update_brightness()
  awful.spawn.easy_async_with_shell("xbacklight -get", function(stdout)
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

    brightness_text:set_markup(icon .. " " .. math.floor(tonumber(brightness)) .. "%")
  end)
end

-- Update the brightness initially
update_brightness()

-- Refresh the brightness every 5 seconds
awful.widget.watch("bash -c 'xbacklight -get'", 10, function(widget, stdout)
  update_brightness()
end)

return brightness_text
