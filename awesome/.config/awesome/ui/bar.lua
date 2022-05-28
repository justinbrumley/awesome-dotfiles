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
  })

  awful.placement.left(s.mywibar, { margins = beautiful.useless_gap })

  -- Create a textclock widget
  s.clock = wibox.widget.textclock('<span color="#ffffff" font="Fira Code 15">%H%n%M</span>', 5)
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
        s.clock,
        top = 12,
        bottom = 12,
        left = 6,
        right = 6,
        layout = wibox.container.margin,
      },
      bg = beautiful.bg_normal,
      shape = gears.shape.rounded_rect,
      layout = wibox.container.background,
    },

    { widget = wibox.container.margin, bottom = beautiful.useless_gap }, -- spacer

    require('ui.taglist')(s),

    { widget = wibox.container.margin, bottom = beautiful.useless_gap }, -- spacer

    -- TODO: Move each widget to their own file to handle logic
    -- Just placeholder images for now
    { -- check notifications for unread slack?
      {
        {
          {
            image = "/home/justin/.config/awesome/icons/slack-indicator.svg",
            widget = wibox.widget.imagebox,
          },
          spacing = 10,
          layout = wibox.layout.fixed.vertical,
        },
        margins = 12,
        layout = wibox.container.margin,
      },
      bg = beautiful.bg_normal,
      shape = gears.shape.rounded_rect,
      layout = wibox.container.background,
    },

    { widget = wibox.container.margin, bottom = beautiful.useless_gap }, -- spacer

    { -- check notifications for unread discord?
      {
        {
          {
            image = "/home/justin/.config/awesome/icons/discord-tray.svg",
            widget = wibox.widget.imagebox,
          },
          spacing = 10,
          layout = wibox.layout.fixed.vertical,
        },
        margins = 12,
        layout = wibox.container.margin,
      },
      bg = beautiful.bg_normal,
      shape = gears.shape.rounded_rect,
      layout = wibox.container.background,
    },

    { widget = wibox.container.margin, bottom = beautiful.useless_gap }, -- spacer

    { -- Pause/Resume spotify on click w/playerctl
      {
        {
          {
            image = "/home/justin/.config/awesome/icons/spotify-indicator.svg",
            widget = wibox.widget.imagebox,
          },
          spacing = 10,
          layout = wibox.layout.fixed.vertical,
        },
        margins = 12,
        layout = wibox.container.margin,
      },
      bg = beautiful.bg_normal,
      shape = gears.shape.rounded_rect,
      layout = wibox.container.background,
    },

    { widget = wibox.container.margin, bottom = beautiful.useless_gap }, -- spacer

    { -- Get volume and network information and update icons based on status
      {
        {
          {
            image = "/home/justin/.config/awesome/icons/volume-level-high.svg",
            widget = wibox.widget.imagebox,
          },
          {
            image = "/home/justin/.config/awesome/icons/network-wired.svg",
            widget = wibox.widget.imagebox,
          },
          spacing = 10,
          layout = wibox.layout.fixed.vertical,
        },
        margins = 12,
        layout = wibox.container.margin,
      },
      bg = beautiful.bg_normal,
      shape = gears.shape.rounded_rect,
      layout = wibox.container.background,
    },

    { widget = wibox.container.margin, bottom = beautiful.useless_gap }, -- spacer

    { -- Real Systray, hidden by default
      {
        {
          s.systray,
          layout = wibox.layout.align.vertical,
        },
        top = 0,
        bottom = 0,
        left = 12,
        right = 12,
        layout = wibox.container.margin,
      },
      bg = beautiful.bg_normal,
      shape = gears.shape.rounded_rect,
      layout = wibox.container.background,
    },

    layout = wibox.layout.fixed.vertical,
  }
end)
