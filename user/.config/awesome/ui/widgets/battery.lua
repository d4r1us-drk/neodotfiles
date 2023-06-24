local wibox = require("wibox")
local awful = require("awful")

-- Create a text widget to display the battery percentage and power profile
local battery_text = wibox.widget.textbox()

local function update_battery_widget(widget, stdout)
  -- Get the current battery percentage and charging status
  local battery_percentage = tonumber(string.match(stdout, "(%d?%d?%d)%%"))
  local ac_adapter_status = io.popen("cat /sys/class/power_supply/AC/online"):read("*line")

  -- Get the current power profile
  local currntpwr = io.popen("powerprofilesctl get"):read("*line")

  -- Set the appropriate power profile symbol based on the current power profile
  local pwr_symbol = ""
  if currntpwr == "performance" then
    pwr_symbol = " - 󰓅 Performance"
  elseif currntpwr == "balanced" then
    pwr_symbol = " - 󰾅 Balanced"
  elseif currntpwr == "power-saver" then
    pwr_symbol = " - 󰾆 PowerSaver"
  end

  -- Set the appropriate battery icon based on the current battery percentage and charging status
  local icon = "󰁹"
  if ac_adapter_status == "1" then
    if battery_percentage >= 100 then
      icon = "󰂅"
    elseif battery_percentage >= 90 then
      icon = "󰂋"
    elseif battery_percentage >= 80 then
      icon = "󰂊"
    elseif battery_percentage >= 70 then
      icon = "󰢞"
    elseif battery_percentage >= 60 then
      icon = "󰂉"
    elseif battery_percentage >= 50 then
      icon = "󰢝"
    elseif battery_percentage >= 40 then
      icon = "󰂈"
    elseif battery_percentage >= 30 then
      icon = "󰂇"
    elseif battery_percentage >= 20 then
      icon = "󰂆"
    else
      icon = "󰢜"
    end
  else
    if battery_percentage >= 100 then
      icon = "󰁹"
    elseif battery_percentage >= 90 then
      icon = "󰂂"
    elseif battery_percentage >= 80 then
      icon = "󰂁"
    elseif battery_percentage >= 70 then
      icon = "󰂀"
    elseif battery_percentage >= 60 then
      icon = "󰁿"
    elseif battery_percentage >= 50 then
      icon = "󰁾"
    elseif battery_percentage >= 40 then
      icon = "󰁽"
    elseif battery_percentage >= 30 then
      icon = "󰁼"
    elseif battery_percentage >= 20 then
      icon = "󰁻"
    else
      icon = "󰂃"
    end
  end

  -- Set the text of the battery_text widget with the battery icon, battery percentage, and power profile symbol
  battery_text:set_markup("<span font='mononoki Nerd Font 13'>" ..
    icon .. "</span>" .. " " .. battery_percentage .. "%" .. pwr_symbol)
end

-- Use the acpi command to get the battery information and call the update_battery_widget function
awful.widget.watch('acpi', 10, function(widget, stdout)
  update_battery_widget(widget, stdout)
end)

-- Create a battery widget that contains the text widget
local battery_widget = wibox.widget {
  battery_text,
  layout = wibox.layout.align.horizontal
}

-- Add a tooltip to the battery widget
battery_widget.tooltip = awful.tooltip {
  objects = { battery_widget },
  timer_function = function()
    local remaining_time = "Unknown"
    local status = io.popen("acpi -b"):read("*line")
    local percentage = tonumber(string.match(status, "(%d?%d?%d)%%"))
    if percentage ~= nil then
      local time = string.match(status, "%d+:%d+:%d+")
      if time ~= nil then
        if string.match(status, "Discharging") then
          remaining_time = "Time remaining: " .. time
        else
          remaining_time = "Time until fully charged: " .. time
        end
      end
    end
    return remaining_time
  end,
}

return battery_widget
