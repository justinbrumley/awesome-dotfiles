local wibox = require("wibox")
local gears = require("gears")
local beautiful = require('beautiful')

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local function render_systray(s)
  -- TODO: Get volume and network information and update icons based on status
  return wibox.widget {
    {
      {
        {
          image = "/home/justin/.config/awesome/icons/network/network-wired.svg",
          widget = wibox.widget.imagebox,
        },
        {
          image = "/home/justin/.config/awesome/icons/volume/volume-level-high.svg",
          widget = wibox.widget.imagebox,
        },
        spacing = dpi(10),
        layout = wibox.layout.fixed.vertical,
      },
      margins = dpi(12),
      layout = wibox.container.margin,
    },
    bg = beautiful.bg_normal,
    shape = gears.shape.rounded_rect,
    layout = wibox.container.background,
  }
end

return render_systray
