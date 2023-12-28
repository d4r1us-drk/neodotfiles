local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local wifi_widget = wibox.widget.textbox()

local function get_wifi_strength(callback)
    local cmd = [[nmcli -t -f active,ssid,signal dev wifi | grep yes | cut -d ":" -f3]]
    awful.spawn.easy_async_with_shell(cmd, function(stdout)
        local strength = tonumber(stdout) or 0
        callback(strength)
    end)
end

local function update_wifi_widget()
    local constate = ""
    local currentwfi = ""

    -- Get connection state and SSID
    local cmd = [[nmcli dev | grep wifi | sed 's/ \{2,\}/|/g' | cut -d '|' -f3,4 | head -1]]
    awful.spawn.easy_async_with_shell(cmd, function(output)
        for token in string.gmatch(output, "[^|\n]+") do
            if constate == "" then
                constate = token
            else
                currentwfi = token
            end
        end

        -- Update wifi widget
        if constate == "disconnected" then
            wifi_widget:set_text("󰤮  ")
        elseif constate == "connected" then
            get_wifi_strength(function(strength)
                local icon = ""
                if strength <= 30 then
                    icon = "󰤟 "
                elseif strength <= 60 then
                    icon = "󰤢 "
                elseif strength <= 90 then
                    icon = "󰤥 "
                else
                    icon = "󰤨 "
                end
                wifi_widget:set_text(icon .. currentwfi)
            end)
        else
            wifi_widget:set_text("󰤮  ")
        end
    end)
end

-- Update the widget initially
update_wifi_widget()

-- Refresh the widget every 10 seconds
local timer = gears.timer.start_new(5, function()
    update_wifi_widget()
    return true
end)

return wifi_widget
