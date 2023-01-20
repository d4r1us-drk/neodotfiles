-- Apps
local apps = {
  terminal = "alacritty",
  editor = "emacsclient -c -a emacs",
  music = "alacritty -t musik --class musik,musik -e musikcube",
  chat = "revolt-desktop",
  game = "retroarch",
  file = "alacritty -t vifm --class vifm,vifm -e ./.config/vifm/scripts/vifmrun",
  browser = "firefox",
  office = "libreoffice"
}
return apps
