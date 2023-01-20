local awful = require("awful")
-- Window related mouse bindings
client.connect_signal(
  "request::default_mousebindings",
  function()
    awful.mouse.append_client_mousebindings(
      {
        awful.button(
          { },
          1,
          function(c)
            c:activate {context = "mouse_click"}
          end
        ),
        awful.button(
          { modkey },
          1,
          function(c)
            c:activate {context = "mouse_click", action = "mouse_move"}
          end
        ),
        awful.button(
          { modkey },
          3,
          function(c)
            c:activate {context = "mouse_click", action = "mouse_resize"}
          end
        )
      }
    )
  end
)
-- Mouse bindings on desktop
awful.mouse.append_global_mousebindings(
  {
    awful.button(
      { },
      4,
      awful.tag.viewprev
    ),
    awful.button(
      { },
      5,
      awful.tag.viewnext
    )
  }
)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
