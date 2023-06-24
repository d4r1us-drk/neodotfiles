local awful = require("awful")
local wibox = require("wibox")

local wifi_widget = wibox.widget {
  widget = wibox.widget.textbox
}

local function get_wifi_strength()
  local cmd = [[nmcli -t -f active,ssid,signal dev wifi | grep yes | cut -d ":" -f3]]
  local f = io.popen(cmd)
  local strength = f:read("*all")
  f:close()
  strength = tonumber(strength)

  if strength <= 30 then
    return 1
  elseif strength <= 60 then
    return 2
  elseif strength <= 90 then
    return 3
  else
    return 4
  end
end

local function update_wifi_widget()
  local constate = ""
  local currentwfi = ""

  -- Get connection state and SSID
  local cmd = [[nmcli dev | grep wifi | sed 's/ \{2,\}/|/g' | cut -d '|' -f3,4 | head -1]]
  local f = io.popen(cmd)
  local output = f:read("*all")
  f:close()

  for token in string.gmatch(output, "[^|\n]+") do
    if constate == "" then
      constate = token
    else
      currentwfi = token
    end
  end

  -- Update wifi widget
  if constate == "disconnected" then
    wifi_widget:set_text("󰤮 ")
  elseif constate == "connected" then
    local strength = get_wifi_strength()
    local icon = ""
    if strength == 1 then
      icon = "󰤟 "
    elseif strength == 2 then
      icon = "󰤢 "
    elseif strength == 3 then
      icon = "󰤥 "
    elseif strength == 4 then
      icon = "󰤨 "
    end
    wifi_widget:set_text(icon .. currentwfi)
  else
    wifi_widget:set_text("󰤮 ")
  end
end

-- Update the widget every five seconds
awful.widget.watch("bash -c 'source $HOME/.profile; wifi-widget'", 10, function(widget, stdout)
  update_wifi_widget()
end)

return wifi_widget
