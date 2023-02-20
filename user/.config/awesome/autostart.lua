local awful = require("awful")
-- Session manager
awful.util.spawn_with_shell(
  "lxpolkit &"
)
-- Wallpapers manager
awful.util.spawn_with_shell(
  "$HOME/.fehbg &"
)
-- Automatically hide the cursor
awful.util.spawn_with_shell(
  "unclutter --hide-on-touch &"
)
-- Compositor
awful.util.spawn_with_shell(
  "picom --experimental-backends --config ~/.config/picom/picom.conf &"
)
-- Power manager
awful.util.spawn_with_shell(
  "xfce4-power-manager &"
)
