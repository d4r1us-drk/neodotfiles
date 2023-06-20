-- Apps config, see keymaps/keyboard.lua to see how this is handled in keybindings
local apps = {
  terminal     = "wezterm",                                              -- Selected terminal emulator
  -- Rofi settings
  drunner      = "rofi -show drun -show-icons",                          -- Desktop runner
  runner       = "rofi -show run",                                       -- Normal runner
  runner_power = "$HOME/.config/rofi/scripts/rofi_power",                -- Power manager
  runner_mount = "$HOME/.config/rofi/scripts/rofi_mount",                -- Drive mounter
  runner_blue  = "$HOME/.config/rofi/scripts/rofi_blue",                 -- Bluetooth manager
  runner_wifi  = "$HOME/.config/rofi/scripts/rofi_wifi",                 -- Wifi manager
  runner_scrot = "$HOME/.config/rofi/scripts/rofi_scrot",                -- Screenshots manager
  runner_emoji = "$HOME/.config/rofi/scripts/rofi_emoji",                -- Emojis manager
  runner_wall  = "$HOME/.config/rofi/scripts/rofi_wall",                 -- Wallpapers manager
  -- Other scripts
  vidytfzf     = "wezterm start --class vidytfzf -- ytfzf -flstT chafa", -- Youtube
  musytfzf     = "wezterm start --class musytfzf -- ytfzf -mlstT chafa", -- Youtube Music
  ani_cli      = "wezterm start --class ani-cli -- ani-cli",             -- Anime
  flix_cli     = "wezterm start --class flix-cli -- flix-cli",           -- Movies
  newsboat     = "wezterm start --class newsboat -- newsboat",           -- Newsboat
  -- Selected apps
  editor       = "neovide --neovim-bin .local/bin/lvim",                 -- TAG 1
  file         = "wezterm start --class vifm -- vifm",                   -- TAG 2
  browser      = "firefox",                                              -- TAG 3
  chat         = "signal-desktop",                                       -- TAG 4
  music        = "wezterm start --class cmus -- cmus",                   -- TAG 5
  videoeditor  = "org.kde.kdenlive",                                     -- TAG 6
  imageeditor  = "org.kde.krita",                                        -- TAG 7
  noteapp      = "com.notesnook.Notesnook",                              -- TAG 8
  game         = "retroarch"                                             -- TAG 9
}
return apps
