local awful = require("awful")

-- Automatically focus windows on hover
-- client.connect_signal("mouse::enter", function(c)
--   if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
--     and awful.client.focus.filter(c) then
--     client.focus = c
--   end
-- end)
