-- Apps selection, see config/keys.lua to see how this is handled in keybindings
local apps = {
    terminal     = "wezterm",                                                 -- terminal emulator

    -- rofi
    drunner      = "rofi -show drun -show-icons",                             -- desktop runner
    runner       = "rofi -show run",                                          -- normal runner
    runner_power = "$HOME/.config/rofi/scripts/rofi_power",                   -- power manager
    runner_mount = "$HOME/.config/rofi/scripts/rofi_mount",                   -- drive mounter
    runner_blue  = "$HOME/.config/rofi/scripts/rofi_blue",                    -- bluetooth manager
    runner_wifi  = "$HOME/.config/rofi/scripts/rofi_wifi",                    -- wifi manager
    runner_scrot = "$HOME/.config/rofi/scripts/rofi_scrot",                   -- screenshots manager
    runner_emoji = "$HOME/.config/rofi/scripts/rofi_emoji",                   -- emojis manager
    runner_wall  = "$HOME/.config/rofi/scripts/rofi_wall",                    -- wallpapers manager

    -- terminal scripts
    ytfzfv       = "wezterm start --class vidytfzf -- ytfzf -flstT ueberzug", -- youtube
    ytfzfm       = "wezterm start --class musytfzf -- ytfzf -mlstT ueberzug", -- youtube music
    ani_cli      = "wezterm start --class ani-cli -- ani-cli",                -- anime
    flix_cli     = "wezterm start --class flix-cli -- flix-cli",              -- movies
    newsboat     = "wezterm start --class newsboat -- newsboat",              -- newsboat
    btop         = "wezterm start --class btop -- btop",                      -- btop
    pulsemixer   = "wezterm start --class pulsemixer -- pulsemixer",          -- pulsemixer

    -- default apps per tag
    editor       = "neovide --neovim-bin .local/bin/lvim",                          -- TAG 1
    file         = "wezterm start --class vifm -- .config/vifm/scripts/vifmrun",    -- TAG 2
    browser      = "flatpak run org.mozilla.firefox",                               -- TAG 3
    chat         = "flatpak run org.signal.Signal",                                 -- TAG 4
    music        = "wezterm start --class cmus -- cmus",                            -- TAG 5
    videoeditor  = "flatpak run org.kde.kdenlive",                                  -- TAG 6
    imageeditor  = "flatpak run org.kde.krita",                                     -- TAG 7
    office       = "flatpak run org.libreoffice.LibreOffice",                       -- TAG 8
    game         = "flatpak run com.valvesoftware.Steam"                            -- TAG 9
}
return apps
