-- Required libraries
local awful = require("awful")
local wibox = require("wibox")

-- Create text widget
local volume_widget = wibox.widget.textbox()

-- Function to update the text widget
local function update_volume(widget)
  local mute = io.popen("pamixer --get-mute"):read()
  if mute == "true\n" then
    widget:set_text("󰕿x")
  else
    local vol = tonumber(io.popen("pamixer --get-volume"):read())
    local icon
    if vol > 50 then
      icon = "󰕾"
    elseif vol > 10 then
      icon = "󰖀"
    elseif vol > 0 then
      icon = "󰕿"
    else
      widget:set_text("󰕿x")
      return
    end
    widget:set_text(icon .. " " .. vol .. "%")
  end
end

-- Update the widget every 5 seconds
awful.widget.watch("bash -c 'pamixer --get-volume'", 10, function(widget, stdout)
  update_volume(widget)
end, volume_widget)

return volume_widget
