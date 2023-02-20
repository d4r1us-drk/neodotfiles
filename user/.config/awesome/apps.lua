-- Apps config, see keymaps/keyboard.lua to see how this is handled in keybindings
local apps = {
  terminal        = "wezterm",                                                                 -- Selected terminal emulator
  -- Rofi settings
  drunner         = "rofi -show drun -show-icons",                                             -- Desktop runner
  runner          = "rofi -show run",                                                          -- Normal runner
  runner_power    = "$HOME/.config/rofi/scripts/rofi_power",                                   -- Power manager
  runner_wifi     = "$HOME/.config/rofi/scripts/rofi_wifi",                                    -- Wifi manager
  runner_scrot    = "$HOME/.config/rofi/scripts/rofi_scrot",                                   -- Screenshots manager
  runner_emoji    = "$HOME/.config/rofi/scripts/rofi_emoji",                                   -- Emojis manager
  runner_wall     = "$HOME/.config/rofi/scripts/rofi_wall",                                    -- Wallpapers manager
  -- Other scripts
  ytfzf           = "wezterm start --class ytfzf -- ytfzf -flstT chafa",                       -- Youtube
  ytfzf_music     = "wezterm start --class ytfzf_music -- ytfzf -mlstT chafa",                 -- Youtube Music
  ani_cli         = "wezterm start --class ani-cli -- ani-cli",                                -- Anime
  flix_cli        = "wezterm start --class flix-cli -- flix-cli",                              -- Movies
  tut             = "wezterm start --class tut -- tut",                                        -- Mastodon
  newsboat        = "wezterm start --class newsboat -- newsboat -u ~/.config/newsboat/urls",   -- Newsboat
  -- Selected apps
  editor          = "neovide --neovim-bin ./.local/bin/lvim",                                  -- TAG 1
  file            = "wezterm start --class vifm -- ./.config/vifm/scripts/vifmrun",            -- TAG 2
  browser         = "firefox",                                                                 -- TAG 3
  chat            = "revolt-desktop",                                                          -- TAG 4
  music           = "wezterm start --class cmus -- cmus",                                     -- TAG 5
  office          = "libreoffice",                                                             -- TAG 8
  game            = "retroarch"                                                                -- TAG 9
}
return apps
