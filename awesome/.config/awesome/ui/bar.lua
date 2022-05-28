local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require('naughty')

awful.screen.connect_for_each_screen(function(s)
  -- Create the wibox
  s.mywibar = awful.wibar({
    type = "dock",
    position = "left",
    screen = s,
    width = 50,
    height = s.geometry.height - (beautiful.useless_gap * 4),
    ontop = true,
    visible = true,
    opacity = 0.95,
  })

  awful.placement.left(s.mywibar, { margins = beautiful.useless_gap })

  -- Create a textclock widget
  s.mytextclock = wibox.widget.textclock('<span color="#ffffff" font="Fira Code 15">%H%n%M</span>', 5)
  s.mytextclock.align = "center"

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

  -- Hide bar when a splash widget is visible
  awesome.connect_signal("widgets::splash::visibility", function(vis)
    screen.primary.mywibar.visible = not vis
  end)

  client.connect_signal("property::fullscreen", remove_wibar)

  client.connect_signal("request::unmanage", add_wibar)

  -- Add widgets to the wibox
  s.mywibar:setup {
    {
      layout = wibox.layout.align.vertical,
      require('ui.taglist')(s),
      {
        {
          widget = wibox.container.background,
        },
        layout = wibox.layout.flex.vertical,
      },
      {
        {
          {
            {
              s.systray,
              layout = wibox.layout.align.vertical,
            },
            margins = 6,
            layout = wibox.container.margin,
          },
          bg = beautiful.bg_light,
          shape = gears.shape.rounded_rect,
          layout = wibox.container.background,
        },
        { widget = wibox.container.margin, bottom = 20 },
        s.mytextclock,
        layout = wibox.layout.fixed.vertical,
      },
    },
    widget = wibox.container.margin,
    margins = 10,
  }
end)
