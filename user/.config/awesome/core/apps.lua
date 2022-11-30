-- Apps
local apps = {
  terminal = "alacritty",
  editor = "emacsclient -c -a emacs",
  music = "alacritty -t cmus --class cmus,cmus -e cmus",
  chat = "element-desktop",
  game = "retroarch",
  file = "alacritty -t vifm --class vifm,vifm -e ./.config/vifm/scripts/vifmrun",
  browser = "firefox",
  office = "libreoffice"
}
return apps
