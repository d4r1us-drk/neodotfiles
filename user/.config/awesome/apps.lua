-- Apps
local apps = {
  terminal = "alacritty",
  editor = "emacsclient -c -a emacs",
  music = "alacritty -t musik --class musik,musik -e cmus",
  youm = "alacritty --title youm --class youm,youm -e ytfzf -mlst",
  ytfzf = "alacritty --title ytfzf --class ytfzf,ytfzf -e ytfzf -flst",
  ani = "alacritty --title ani-cli --class ani-cli,ani-cli -e ani-cli -f",
  flix = "alacritty --title flix-cli --class flix-cli,flix-cli -e flix-cli",
  chat = "revolt-desktop",
  game = "retroarch",
  file = "alacritty -t vifm --class vifm,vifm -e ./.config/vifm/scripts/vifmrun",
  browser = "firefox",
  office = "libreoffice"
}
return apps
