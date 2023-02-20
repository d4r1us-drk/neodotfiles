-- Apps
local apps = {
  terminal = "wezterm",
  editor = "neovide --neovim-bin ./.local/bin/lvim",
  music = "wezterm start --class musik -- cmus",
  youm = "wezterm start --class youm -- ytfzf -mlstT chafa",
  ytfzf = "wezterm start --class ytfzf -- ytfzf -flstT chafa",
  ani = "wezterm start --class ani-cli -- ani-cli",
  flix = "wezterm start --class flix-cli -- flix-cli",
  chat = "revolt-desktop",
  game = "retroarch",
  file = "wezterm start --class vifm -- ./.config/vifm/scripts/vifmrun",
  browser = "firefox",
  office = "libreoffice"
}
return apps
