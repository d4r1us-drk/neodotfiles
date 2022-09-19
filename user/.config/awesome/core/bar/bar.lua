local wibox = require("wibox")
local awful = require("awful")
local theme = require("theme.gruvbox.theme")

-- Keyboard layout widget
mykeyboardlayout = awful.widget.keyboardlayout()

-- Textclock widget
mytextclock = wibox.widget.textclock()

screen.connect_signal("request::desktop_decoration", function(s)
-- Tag names for each screen
    awful.tag({ "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                ""
              }, s, awful.layout.layouts[1])

--  Layoutbox widget
    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }

-- Custom widgets
s.volume = awful.widget.watch(".config/awesome/core/bar/widgets/volume", 1)
s.battery = awful.widget.watch(".config/awesome/core/bar/widgets/battery", 10)
s.wifi = awful.widget.watch(".config/awesome/core/bar/widgets/wifi", 10)
s.brightness = awful.widget.watch(".config/awesome/core/bar/widgets/brightness", 1)
s.layout = awful.widget.watch(".config/awesome/core/bar/widgets/layout", 1)

--  Taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
            awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
        }
    }

--  Wibox
    s.mywibox = awful.wibar {
        position = "top",
        screen   = s,
        widget   = {
          layout = wibox.layout.stack,
          {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                s.mylayoutbox,
                wibox.widget.textbox(" "),
                s.mytaglist,
                wibox.widget.textbox(" "),
            },
            nil,
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_one),
                wibox.container.background(s.layout, theme.bar_bg_one),
                wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_one),
                wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_tre),
                wibox.container.background(s.volume, theme.bar_bg_tre),
                wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_tre),
                wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_for),
                wibox.container.background(s.brightness, theme.bar_bg_for),
                wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_for),
                wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_two),
                wibox.container.background(s.battery, theme.bar_bg_two),
                wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_two),
                wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_fiv),
                wibox.container.background(s.wifi, theme.bar_bg_fiv),
                wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_fiv),
            },
          },
            {
            wibox.container.background(mytextclock, theme.bar_clock),
            valign = "center",
            halign = "center",
            layout = wibox.container.place,
            }

        }
    }
end)
