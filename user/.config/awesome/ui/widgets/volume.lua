-- Required libraries
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

-- Create text widget
local volume_widget = wibox.widget.textbox()

-- Function to update the text widget
local function update_volume_widget()
    awful.spawn.easy_async_with_shell("pamixer --get-mute", function(mute_stdout)
        local mute = mute_stdout:match("^%s*(.-)%s*$") -- Trim leading/trailing whitespaces

        if mute == "true" then
            volume_widget:set_text("󰕿x")
        else
            awful.spawn.easy_async_with_shell("pamixer --get-volume", function(vol_stdout)
                local vol = tonumber(vol_stdout:match("^%s*(.-)%s*$")) -- Trim leading/trailing whitespaces
                local icon

                if vol > 50 then
                    icon = "󰕾"
                elseif vol > 10 then
                    icon = "󰖀"
                elseif vol > 0 then
                    icon = "󰕿"
                else
                    volume_widget:set_text("󰕿x")
                    return
                end

                volume_widget:set_text(icon .. " " .. vol .. "%")
            end)
        end
    end)
end

-- Update the widget initially
update_volume_widget()

-- Refresh the widget every 5 seconds
local timer = gears.timer.start_new(5, function()
    update_volume_widget()
    return true
end)

return volume_widget
