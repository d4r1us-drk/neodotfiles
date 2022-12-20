local awful = require("awful")
local ruled = require("ruled")

-- Rules to apply to new clients.
ruled.client.connect_signal(
  "request::rules",
  function()
    -- All clients will match this rule.
    ruled.client.append_rule {
      id         = "global",
      rule       = { },
      properties = {
        focus     = awful.client.focus.filter,
        raise     = true,
        screen    = awful.screen.preferred,
        placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        callback  = awful.client.setslave
      }
    }

    -- Floating clients.
    ruled.client.append_rule {
      id       = "floating",
      rule_any = {
        hinstance = { "copyq", "pinentry" },
        class    = {
          "Galculator",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "Tor Browser",
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"
        },
        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name    = {
          "Event Tester",  -- xev.
        },
        role    = {
          "AlarmWindow",    -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
        }
      },
      properties = { floating = true }
    }

-- TAG 1
    ruled.client.append_rule {
      rule_any = {
        class = {
               "Emacs",
               "Godot",
               "neovim",
               "Virt-manager"
               }
      },
      properties = { tag = "" },
    }
-- TAG 2
    ruled.client.append_rule {
      rule_any = {
        class = {
          "vifm",
          "pcmanfm",
          "nemo"
        }
      },
      properties = { tag = "" },
    }
-- TAG 3
    ruled.client.append_rule {
      rule_any = {
        class = {
          "Brave-browser",
          "librewolf",
          "firefox",
          "Chromium",
          "Bitwarden",
          "qutebrowser",
          "toot"
        }
      },
      properties = { tag = "" }
    }
-- TAG 4
    ruled.client.append_rule {
      rule_any = {
        class = {
          "gomuks",
          "Signal",
          "Element"
        }
      },
      properties = { tag = "" }
    }
-- TAG 5
    ruled.client.append_rule {
      rule_any = {
        class = {
          "cmus",
          "musik",
          "youm",
          "Audacity",
          "Ardour",
          "Carla2",
          "Carla2-Control"
        }
      },
      properties = { tag = "ﱘ" }
    }
-- TAG 6
    ruled.client.append_rule {
      rule_any = {
        class = {
          "kdenlive",
          "Blender",
          "Natron",
          "SimpleScreenRecorder",
          "Ghb",
          "obs",
          "mpv",
          "ani-cli",
          "flix-cli",
          "ytfzf"
        }
      },
      properties = { tag = "" }
    }
-- TAG 7
    ruled.client.append_rule {
      rule_any = {
        class = {
          "Qjackctl",
          "lsp-plugins",
          "qpwgraph",
          "Gimp-2.10",
          "krita",
          "Inkscape",
          "Xournalpp",
        }
      },
      properties = { tag = "פֿ" }
    }
-- TAG 8
    ruled.client.append_rule {
      rule_any = {
        class = {
          "DesktopEditors",
          "Soffice",
          "libreoffice-startcenter",
          "Joplin"
        }
      },
      properties = { tag = "" }
    }
-- TAG 9
    ruled.client.append_rule {
      rule_any = {
        class = {
          "retroarch",
          "steam"
        }
      },
      properties = { tag = "" }
    }
--}}}
  end
)
