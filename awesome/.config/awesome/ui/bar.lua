local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require('naughty')

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

awful.screen.connect_for_each_screen(function(s)
  -- Create the wibox
  s.mywibar = awful.wibar({
    type = "dock",
    position = "left",
    screen = s,
    width = dpi(50),
    height = s.geometry.height - (beautiful.useless_gap * 4),
    ontop = true,
    visible = true,
  })

  awful.placement.left(s.mywibar, { margins = beautiful.useless_gap })

  -- Create a textclock widget
  s.clock = wibox.widget.textclock('<span color="#9e9d9e" font="Fira Code 15">%H%n%M</span>', 5)
  s.clock.align = "center"

  -- Remove wibar on full screen
  local function remove_wibar(c)
    if c.fullscreen or c.maximized then
      c.screen.mywibar.visible = false
    else
      c.screen.mywibar.visible = true
    end
  end

  -- Remove wibar on full screen
  local function add_wibar(c)
    if c.fullscreen or c.maximized then
      c.screen.mywibar.visible = true
    end
  end

  s.systray = wibox.widget.systray()
  s.systray.set_horizontal(false)
  s.systray.visible = false

  -- Hide bar when a splash widget is visible
  awesome.connect_signal("widgets::splash::visibility", function(vis)
    screen.primary.mywibar.visible = not vis
  end)

  client.connect_signal("property::fullscreen", remove_wibar)

  client.connect_signal("request::unmanage", add_wibar)

  -- Add widgets to the wibox
  s.mywibar:setup {
    {
      {
        {
          image = "/home/justin/.config/awesome/icons/arch/arch.svg",
          widget = wibox.widget.imagebox,
        },
        top = dpi(12),
        bottom = dpi(12),
        left = dpi(12),
        right = dpi(12),
        layout = wibox.container.margin,
      },
      require('ui.taglist')(s),
      layout = wibox.layout.fixed.vertical,
    },

    {
      { layout = wibox.container.margin },
      { layout = wibox.container.margin },

      {
        { -- Real Systray, hidden by default
          {
            s.systray,
            layout = wibox.layout.align.vertical,
          },
          top = 0,
          bottom = 0,
          left = dpi(12),
          right = dpi(12),
          layout = wibox.container.margin,
        },

        require('ui.systray')(s),
        layout = wibox.layout.fixed.vertical,
      },

      layout = wibox.layout.align.vertical,
    },

    {
      s.clock,
      top = dpi(12),
      bottom = dpi(12),
      left = dpi(6),
      right = dpi(6),
      layout = wibox.container.margin,
    },

    layout = wibox.layout.align.vertical,
  }
end)
