-- Apps config, see keymaps/keyboard.lua to see how this is handled in keybindings
local apps = {
  terminal     = "wezterm",                                              -- terminal emulator
  -- rofi settings
  drunner      = "rofi -show drun -show-icons",                          -- desktop runner
  runner       = "rofi -show run",                                       -- normal runner
  runner_power = "$HOME/.config/rofi/scripts/rofi_power",                -- power manager
  runner_mount = "$HOME/.config/rofi/scripts/rofi_mount",                -- drive mounter
  runner_blue  = "$HOME/.config/rofi/scripts/rofi_blue",                 -- bluetooth manager
  runner_wifi  = "$HOME/.config/rofi/scripts/rofi_wifi",                 -- wifi manager
  runner_scrot = "$HOME/.config/rofi/scripts/rofi_scrot",                -- screenshots manager
  runner_emoji = "$HOME/.config/rofi/scripts/rofi_emoji",                -- emojis manager
  runner_wall  = "$HOME/.config/rofi/scripts/rofi_wall",                 -- wallpapers manager
  -- terminal scripts
  vidytfzf     = "wezterm start --class vidytfzf -- ytfzf -flstT chafa", -- youtube
  musytfzf     = "wezterm start --class musytfzf -- ytfzf -mlstT chafa", -- youtube music
  ani_cli      = "wezterm start --class ani-cli -- ani-cli",             -- anime
  flix_cli     = "wezterm start --class flix-cli -- flix-cli",           -- movies
  newsboat     = "wezterm start --class newsboat -- newsboat",           -- newsboat
  btop         = "wezterm start --class btop -- btop",                   -- btop
  htop         = "wezterm start --class htop -- htop",                   -- htop
  pulsemixer   = "wezterm start --class pulsemixer -- pulsemixer",       -- pulsemixer
  alsamixer    = "wezterm start --class alsamixer -- alsamixer",         -- alsamixer
  -- default apps per tag
  editor       = "emacsclient -c -a emacs",                              -- TAG 1
  file         = "wezterm start --class vifm -- vifm",                   -- TAG 2
  browser      = "firefox",                                              -- TAG 3
  chat         = "org.signal.Signal",                                    -- TAG 4
  music        = "wezterm start --class cmus -- cmus",                   -- TAG 5
  videoeditor  = "org.kde.kdenlive",                                     -- TAG 6
  imageeditor  = "org.kde.krita",                                        -- TAG 7
  noteapp      = "com.notesnook.Notesnook",                              -- TAG 8
  game         = "org.libretro.Retroarch"                                -- TAG 9
}
return apps
