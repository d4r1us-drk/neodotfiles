local naughty = require("naughty")
local ruled = require("ruled")
local beautiful = require("beautiful")

-- {{{ Error handling
naughty.connect_signal(
    "request::display_error",
    function(message, startup)
        naughty.notification {
            urgency = "critical",
            title   = "Oops, an error happened".. ( startup and " during startup!" or "!" ),
            message = message
        }
    end
)
-- }}}

-- {{{ Signals
-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal(
   "arrange",
   function (s)
       local max = s.selected_tag.layout.name == "max"
       local only_one = #s.tiled_clients == 1 -- use tiled_clients so that other floating windows don't affect the count
       -- but iterate over clients instead of tiled_clients as tiled_clients doesn't include maximized windows
       for _, c in pairs(s.clients) do
           if (max or only_one) and not c.floating or c.maximized then
               c.border_width = 0
            else
                c.border_width = beautiful.border_width
            end
        end
    end
)
-- }}}
