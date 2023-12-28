local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup"); require("awful.hotkeys_popup.keys")
local apps = require("apps")
require("awful.autofocus")

-- Modkeys.
altkey = "Mod1"
modkey = "Mod4"
conkey = "Control"
shikey = "Shift"

--[[ Main keybinds ]]
--
awful.keyboard.append_global_keybindings({
        -- Show the help menu
        awful.key(
            { modkey },
            "s",
            hotkeys_popup.show_help,
            {
                description = "Show Help Menu",
                group = "Main keybinds"
            }
        ),
        -- Reload awesome
        awful.key(
            { modkey, conkey },
            "r",
            awesome.restart,
            {
                description = "Reload Awesome",
                group = "Main keybinds"
            }
        ),
        -- Open a terminal
        awful.key(
            { modkey },
            "Return",
            function()
                awful.spawn(apps.terminal)
            end,
            {
                description = "Open a terminal",
                group = "Main keybinds"
            }
        ),
})
--[[ ]]
--

--[[ Tags related keybindings ]]
--
awful.keyboard.append_global_keybindings({
    -- Switch to previous tag
    awful.key(
        { modkey },
        "Left",
        awful.tag.viewprev,
        {
            description = "Quickly switch to previous tag",
            group = "Tag keybinds"
        }
    ),
    -- Switch to next tag
    awful.key(
        { modkey },
        "Right",
        awful.tag.viewnext,
        {
            description = "Quickly switch to next tag",
            group = "Tag keybinds"
        }
    ),
    -- Switch back to the previous tag
    awful.key(
        { modkey },
        "Escape",
        awful.tag.history.restore,
        {
            description = "Go back to previus tag (from history)",
            group = "Tag keybinds"
        }
    ),
    -- Switch tags by numbers 1-9
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "Switch tags with number keys from {1 to 9}",
        group       = "Tag keybinds",
        on_press    = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    -- Toggle tags by numbers 1-9
    awful.key {
        modifiers   = { modkey, conkey },
        keygroup    = "numrow",
        description = "Quickly view contents in another tag with number keys from {1 to 9}",
        group       = "Tag keybinds",
        on_press    = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    -- Move focused window to tag by numbers 1-9
    awful.key {
        modifiers   = { modkey, shikey },
        keygroup    = "numrow",
        description = "Move focused window to another tag with number keys from {1 to 9}",
        group       = "Tag keybinds",
        on_press    = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    -- Toggle focused window on tag by numbers 1-9
    awful.key {
        modifiers   = { modkey, conkey, shikey },
        keygroup    = "numrow",
        description = "View focused window on more than one tag with number keys from {1 to 9}",
        group       = "Tag keybinds",
        on_press    = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
})
--[[ ]]
--

--[[ Focus related keybindings ]]
--
awful.keyboard.append_global_keybindings({
    -- Focus next window by index
    awful.key(
        { modkey },
        "j",
        function()
            awful.client.focus.byidx(1)
        end,
        {
            description = "Focus the next window by index",
            group = "Focus keybinds"
        }
    ),
    -- Focus previous window by index
    awful.key(
        { modkey },
        "k",
        function()
            awful.client.focus.byidx(-1)
        end,
        {
            description = "Focus the previous window by index",
            group = "Focus keybinds"
        }
    ),
    -- Focus last focused window
    awful.key(
        { modkey },
        "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {
            description = "Focus back the previous focused window",
            group = "Focus keybinds"
        }
    ),
    -- Focus next screen
    awful.key(
        { modkey, conkey },
        "j",
        function()
            awful.screen.focus_relative(1)
        end,
        {
            description = "Focus the next screen",
            group = "Focus keybinds"
        }
    ),
    -- Focus previous screen
    awful.key(
        { modkey, conkey },
        "k",
        function()
            awful.screen.focus_relative(-1)
        end,
        {
            description = "Focus the previous screen",
            group = "Focus keybinds"
        }
    ),
})
--[[ ]]
--

--[[ Layout keybinds ]]
--
awful.keyboard.append_global_keybindings({
    -- Swap with next window by index
    awful.key(
        { modkey, shikey },
        "j",
        function()
            awful.client.swap.byidx(1)
        end,
        {
            description = "Swap with next window in current layout by index",
            group = "Layout keybinds"
        }
    ),
    -- Swap with previous window by index
    awful.key(
        { modkey, shikey },
        "k",
        function()
            awful.client.swap.byidx(-1)
        end,
        {
            description = "Swap with previous window in current layout by index",
            group = "Layout keybinds"
        }
    ),
    -- Increase master width
    awful.key(
        { modkey },
        "l",
        function()
            awful.tag.incmwfact(0.05)
        end,
        {
            description = "Increase master window width size",
            group = "Layout keybinds"
        }
    ),
    -- Decrease master width
    awful.key(
        { modkey },
        "h",
        function()
            awful.tag.incmwfact(-0.05)
        end,
        {
            description = "Decrease master window width size",
            group = "Layout keybinds"
        }
    ),
    -- Increase the number of master window
    awful.key(
        { modkey, shikey },
        "h",
        function()
            awful.tag.incnmaster(1, nil, true)
        end,
        {
            description = "Increase the number of master windows",
            group = "Layout keybinds"
        }
    ),
    -- Decrease the number of master windows
    awful.key(
        { modkey, shikey },
        "l",
        function()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {
            description = "Decrease the number of master windows",
            group = "Layout keybinds"
        }
    ),
    -- Increase the number of columns
    awful.key(
        { modkey, conkey },
        "h",
        function()
            awful.tag.incncol(1, nil, true)
        end,
        {
            description = "Increase the number of columns in layout",
            group = "Layout keybinds"
        }
    ),
    -- Decrease the number of columns
    awful.key(
        { modkey, conkey },
        "l",
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        {
            description = "Decrease the number of columns in layout",
            group = "Layout keybinds"
        }
    ),
    -- Switch to next layout
    awful.key(
        { modkey },
        "space",
        function()
            awful.layout.inc(1)
        end,
        {
            description = "Switch to the next layout",
            group = "Layout keybinds"
        }
    ),
    -- Switch to previous layout
    awful.key(
        { modkey, shikey },
        "space",
        function()
            awful.layout.inc(-1)
        end,
        {
            description = "Switch to previous layout",
            group = "Layout keybinds"
        }
    ),
    -- Select layouts directly
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numpad",
        description = "Select layouts directly using the numpad",
        group       = "layout",
        on_press    = function(index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    },
    -- Show/Hide Wibox
    awful.key(
        { modkey },
        "b",
        function()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end,
        {
            description = "Toggle the bar",
            group = "Layout keybinds"
        }
    ),
})
--[[ ]]
--

--[[ Window keybinds ]]
--
client.connect_signal(
    "request::default_keybindings",
    function()
        awful.keyboard.append_client_keybindings({
            -- Set focused window to fullscreen
            awful.key(
                { modkey },
                "f",
                function(c)
                    c.fullscreen = not c.fullscreen
                    c:raise()
                end,
                {
                    description = "Toggle fullscreen",
                    group = "Window keybinds"
                }
            ),
            -- Close focused window
            awful.key(
                { modkey },
                "q",
                function(c)
                    c:kill()
                end,
                {
                    description = "Close focused window",
                    group = "Window keybinds"
                }
            ),
            -- Toggle floating mode on focused window
            awful.key(
                { modkey, conkey },
                "space",
                awful.client.floating.toggle,
                {
                    description = "Toggle floating mode on focused window",
                    group = "Window keybinds"
                }
            ),
            -- Move focused window to master
            awful.key(
                { modkey, conkey },
                "Return",
                function(c)
                    c:swap(
                        awful.client.getmaster()
                    )
                end,
                {
                    description = "Move focused window to master",
                    group = "Window keybinds"
                }
            ),
            -- Move focused window to the other screen
            awful.key(
                { modkey },
                "o",
                function(c)
                    c:move_to_screen()
                end,
                {
                    description = "Move focused window to the next screen",
                    group = "Window keybinds"
                }
            ),
            -- Toggle focused window to be on top
            awful.key(
                { modkey },
                "t",
                function(c)
                    c.ontop = not c.ontop
                end,
                {
                    description = "Toggle keep on top for focused window",
                    group = "Window keybinds"
                }
            ),
            -- Jump to urgent window
            awful.key(
                { modkey },
                "u",
                awful.client.urgent.jumpto,
                {
                    description = "Quickly jump to urgent window",
                    group = "Window keybinds"
                }
            ),
        })
    end
)
--[[ ]]
--

--[[ Quick keybinds ]]
awful.keyboard.append_global_keybindings({
    -- Volume
    awful.key(
        {},
        "XF86AudioRaiseVolume",
        function()
            awful.spawn("pamixer -i 5")
        end,
        {
            description = "Increase volume by +5%",
            group = "Quick keybinds"
        }
    ),
    awful.key(
        {},
        "XF86AudioLowerVolume",
        function()
            awful.spawn("pamixer -d 5")
        end,
        {
            description = "Decrease volume by +5%",
            group = "Quick keybinds"
        }
    ),
    awful.key(
        {},
        "XF86AudioMute",
        function()
            awful.spawn("pamixer -t")
        end,
        {
            description = "Mute volume",
            group = "Quick keybinds"
        }
    ),
    awful.key(
        {},
        "XF86AudioMicMute",
        function()
            awful.spawn("pamixer --default-source -t")
        end,
        {
            description = "Mute microphone",
            group = "Quick keybinds"
        }
    ),
    -- Brightness
    awful.key(
        {},
        "XF86MonBrightnessUp",
        function()
            awful.spawn("brightnessctl s 5%+")
        end,
        {
            description = "Increase brightness by +5%",
            group = "Quick keybinds"
        }
    ),
    awful.key(
        {},
        "XF86MonBrightnessDown",
        function()
            awful.spawn("brightnessctl s 5%-")
        end,
        {
            description = "Decrease brightness by -5%",
            group = "Quick keybinds"
        }
    ),
    -- Display configuration
    awful.key(
        {},
        "XF86Display",
        function()
            awful.spawn("arandr")
        end,
        {
            description = "Configure the display using arandr",
            group = "Quick keybinds"
        }
    ),
    -- Apps (Super + a followed by KEY)
    awful.key(
        { modkey },
        "a",
        function()
            local grabber = awful.keygrabber.run(
                function(_, key, event)
                    if event == "release" then
                        return
                    end
                    if key == "1" then
                        awful.util.spawn(apps.editor)      -- TAG 1
                    elseif key == "2" then
                        awful.util.spawn(apps.file)        -- TAG 2
                    elseif key == "3" then
                        awful.util.spawn(apps.browser)     -- TAG 3
                    elseif key == "4" then
                        awful.util.spawn(apps.chat)        -- TAG 4
                    elseif key == "5" then
                        awful.util.spawn(apps.music)       -- TAG 5
                    elseif key == "6" then
                        awful.util.spawn(apps.videoeditor) -- TAG 5
                    elseif key == "7" then
                        awful.util.spawn(apps.imageeditor) -- TAG 5
                    elseif key == "8" then
                        awful.util.spawn(apps.office)      -- TAG 8
                    elseif key == "9" then
                        awful.util.spawn(apps.game)        -- TAG 9
                    end
                    awful.keygrabber.stop(grabber)
                end
            )
        end,
        {
            description = "Launch apps with {Super + a} keychord and then numbers from {1 to 9}",
            group = "Quick keybinds"
        }
    ),
    -- Keyboard layouts (Super + x followed by KEY)
    awful.key(
        { modkey },
        "x",
        function()
            local grabber = awful.keygrabber.run(
                function(_, key, event)
                    if event == "release" then
                        return
                    end
                    if key == "e" then
                        awful.util.spawn("setxkbmap es")
                    elseif key == "u" then
                        awful.util.spawn("setxkbmap us")
                    end
                    awful.keygrabber.stop(grabber)
                end
            )
        end,
        {
            description = "Change keyboard layout with {Super + x} keychord and then {e} for spanish and {u} for english",
            group = "Quick keybinds"
        }
    ),
    -- Runners (Super + p followed by KEY)
    awful.key(
        { modkey },
        "p",
        function()
            local grabber = awful.keygrabber.run(
                function(_, key, event)
                    if event == "release" then
                        return
                    end
                    if key == "d" then
                        awful.util.spawn(apps.drunner)
                    elseif key == "r" then
                        awful.util.spawn(apps.runner)
                    elseif key == "q" then
                        awful.spawn.with_shell(apps.runner_power)
                    elseif key == "i" then
                        awful.spawn.with_shell(apps.runner_wifi)
                    elseif key == "s" then
                        awful.spawn.with_shell(apps.runner_scrot)
                    elseif key == "e" then
                        awful.spawn.with_shell(apps.runner_emoji)
                    elseif key == "w" then
                        awful.spawn.with_shell(apps.runner_wall)
                    elseif key == "m" then
                        awful.spawn.with_shell(apps.runner_mount)
                    elseif key == "b" then
                        awful.spawn.with_shell(apps.runner_blue)
                    end
                    awful.keygrabber.stop(grabber)
                end
            )
        end,
        {
            description = "Launch quick action menus with {Super + p} keychord and then {d, r, e, q, i, b, s, z, w}",
            group = "Quick keybinds"
        }
    ),
    -- Multimedia scripts (Super + t followed by KEY)
    awful.key(
        { modkey },
        "t",
        function()
            local grabber = awful.keygrabber.run(
                function(_, key, event)
                    if event == "release" then
                        return
                    end
                    if key == "y" then
                        awful.util.spawn(apps.vidytfzf)
                    elseif key == "m" then
                        awful.util.spawn(apps.musytfzf)
                    elseif key == "a" then
                        awful.util.spawn(apps.ani_cli)
                    elseif key == "f" then
                        awful.util.spawn(apps.flix_cli)
                    elseif key == "r" then
                        awful.util.spawn(apps.newsboat)
                    elseif key == "b" then
                        awful.util.spawn(apps.btop)
                    elseif key == "h" then
                        awful.util.spawn(apps.htop)
                    elseif key == "p" then
                        awful.util.spawn(apps.pulsemixer)
                    elseif key == "o" then
                        awful.util.spawn(apps.alsamixer)
                    end
                    awful.keygrabber.stop(grabber)
                end
            )
        end,
        {
            description = "Launch multimedia terminal scripts with {Super + t} and then {m, y, a, f}",
            group = "Quick keybinds"
        }
    ),
})
--[[ ]]
