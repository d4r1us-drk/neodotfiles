--- {{{ Imports
local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local theme = require("ui.theme")
local separators = require("ui.custom-widgets.separator")
--- }}}

-- Textclock widget
mytextclock = wibox.widget.textclock()

screen.connect_signal(
  "request::desktop_decoration",
  function(s)
-- Tag names for each screen
    awful.tag(
      {
        "", -- EDITOR
        "",  -- FILE MANAGER
        "", -- WEB BROWSER
        "",  -- CHAT
        "ﱘ",  -- MUSIC
        "", -- VIDEO
        "פֿ",  -- IMAGE/EDIT TOOLS
        "",  -- OFFICE
        ""   -- GAMES
      },
      s,
      awful.layout.layouts[1]
    )

--  Layoutbox widget
    s.mylayoutbox = awful.widget.layoutbox {
      screen  = s,
      buttons = {
        awful.button(
          { },
          1,
          function ()
            awful.layout.inc(1)
          end
        ),
        awful.button(
          { },
          3,
          function ()
            awful.layout.inc(-1)
          end
        ),
        awful.button(
          { },
          4,
          function ()
            awful.layout.inc(-1)
          end
        ),
        awful.button(
          { },
          5,
          function ()
            awful.layout.inc(1)
          end
        ),
      }
    }

-- Custom widgets
    -- Volume widget
    s.volume =
      awful.widget.watch(
        ".config/awesome/ui/custom-widgets/volume",
        1 -- Update time in seconds
      )
    -- Battery widget
    s.battery =
      awful.widget.watch(
        ".config/awesome/ui/custom-widgets/battery",
        10 -- Update time in seconds
      )
    -- Wifi widget
    s.wifi =
      awful.widget.watch(
        ".config/awesome/ui/custom-widgets/wifi",
        10 -- Update time in seconds
      )
    -- Brightness widget
    s.brightness =
      awful.widget.watch(
        ".config/awesome/ui/custom-widgets/brightness",
        1 -- Update time in seconds
      )
    -- Keyboard layout widget
    s.layout =
      awful.widget.watch(
        ".config/awesome/ui/custom-widgets/layout",
        1 -- Update time in seconds
      )

--  Taglist widget
    s.mytaglist = awful.widget.taglist {
      screen  = s,
      filter  = awful.widget.taglist.filter.all,
      buttons = {
        awful.button(
          { },
          1,
          function(t)
            t:view_only()
          end
        ),
        awful.button(
          { modkey },
          1,
          function(t)
            if client.focus then
              client.focus:move_to_tag(t)
            end
          end
        ),
        awful.button(
          { },
          3,
          awful.tag.viewtoggle
        ),
        awful.button(
          { modkey },
          3,
          function(t)
            if client.focus then
              client.focus:toggle_tag(t)
            end
          end
        ),
        awful.button(
          { },
          4,
          function(t)
            awful.tag.viewprev(t.screen)
          end
        ),
        awful.button(
          { },
          5,
          function(t)
            awful.tag.viewnext(t.screen)
          end
        ),
      }
    }

-- Separators
    local spr     = wibox.widget.textbox(" ")
    local spr_one_dl = separators.arrow_left(theme.bg_normal, theme.bar_bg_one)
    local spr_one_ld = separators.arrow_left(theme.bar_bg_one, theme.bar_bg_two)
    local spr_two_dl = separators.arrow_left(theme.bar_bg_two, theme.bar_bg_two)
    local spr_two_ld = separators.arrow_left(theme.bar_bg_two, theme.bar_bg_tre)
    local spr_tre_dl = separators.arrow_left(theme.bar_bg_tre, theme.bar_bg_tre)
    local spr_tre_ld = separators.arrow_left(theme.bar_bg_tre, theme.bar_bg_for)
    local spr_for_dl = separators.arrow_left(theme.bar_bg_for, theme.bar_bg_for)
    local spr_for_ld = separators.arrow_left(theme.bar_bg_for, theme.bar_bg_fiv)
    local spr_fiv_dl = separators.arrow_left(theme.bar_bg_fiv, theme.bar_bg_fiv)

--  Wibox
    s.mywibox = awful.wibar {
      position = "top",
      screen   = s,
      widget   = {
        layout = wibox.layout.stack,
        {
          layout = wibox.layout.align.horizontal,
          {
            -- [[ Left widgets ]]
            layout = wibox.layout.fixed.horizontal,
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            -- Layoubox widget
            s.mylayoutbox,
            wibox.widget.textbox(" "),
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            -- Taglist widget
            s.mytaglist,
            wibox.widget.textbox(" "),
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
          },
          nil,
          {
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            -- [[ Right widgets ]]
            layout = wibox.layout.fixed.horizontal,
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            -- Keyboar layout widget
            wibox.container.background(spr_one_dl, theme.bar_bg_one),
            wibox.container.background(spr, theme.bar_bg_one),
            wibox.container.background(s.layout, theme.bar_bg_one),
            wibox.container.background(spr, theme.bar_bg_one),
            wibox.container.background(spr_one_ld, theme.bar_bg_one),
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            -- Volume widget
            wibox.container.background(spr_two_dl, theme.bar_bg_two),
            wibox.container.background(s.volume, theme.bar_bg_two),
            wibox.container.background(spr, theme.bar_bg_two),
            spr_two_ld,
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            -- Brightness widget
            wibox.container.background(spr_tre_dl, theme.bar_bg_tre),
            wibox.container.background(s.brightness, theme.bar_bg_tre),
            wibox.container.background(spr, theme.bar_bg_tre),
            wibox.container.background(spr_tre_ld, theme.bar_bg_tre),
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            -- Battery widget
            wibox.container.background(spr_for_dl, theme.bar_bg_for),
            wibox.container.background(s.battery, theme.bar_bg_for),
            wibox.container.background(spr, theme.bar_bg_for),
            wibox.container.background(spr_for_ld, theme.bar_bg_for),
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            -- Wifi widget
            wibox.container.background(spr_fiv_dl, theme.bar_bg_fiv),
            wibox.container.background(s.wifi, theme.bar_bg_fiv),
            wibox.container.background(spr, theme.bar_bg_fiv),
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
          },
        },
        {
          -- [[ Center widgets ]]
          -- Clock widget
          wibox.container.background(mytextclock, theme.bar_clock),
          valign = "center",
          halign = "center",
          layout = wibox.container.place,
        }
      }
    }
  end
)
