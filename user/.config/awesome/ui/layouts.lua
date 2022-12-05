local awful = require("awful")
-- Custom added layouts
local centerwork = require("modules.custom-layouts.centerwork")
-- {{{ Selected layouts
tag.connect_signal(
  "request::default_layouts",
  function()
    awful.layout.append_default_layouts(
      {
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        centerwork,
--        awful.layout.suit.fair,
--        awful.layout.suit.fair.horizontal,
--        awful.layout.suit.spiral,
--        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
--        awful.layout.suit.magnifier,
--        awful.layout.suit.corner.nw,
        awful.layout.suit.floating,
      }
    )
  end
)
-- }}}