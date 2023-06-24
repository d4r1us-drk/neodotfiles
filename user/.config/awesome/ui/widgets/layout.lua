local wibox = require("wibox")
local awful = require("awful")

-- Create a textbox widget
local layout_text = wibox.widget.textbox()

-- Function to update the layout value
local function update_layout()
  awful.spawn.easy_async_with_shell("setxkbmap -query | grep -oP 'layout:\\s*\\K\\w+'", function(stdout)
    local layout = stdout:gsub("\n", "")
    layout_text:set_markup("󰌌 " .. layout:upper())
  end)
end

-- Update the layout initially
update_layout()

-- Refresh the layout every 5 seconds
awful.widget.watch("bash -c 'setxkbmap -query | grep -oP \"layout:\\\\s*\\\\K\\\\w+\"'", 10, function(widget, stdout)
  update_layout()
end)

return layout_text
