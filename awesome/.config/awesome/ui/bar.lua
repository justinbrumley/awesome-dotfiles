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

  local checked_checkbox = wibox.widget {
    widget = wibox.widget.checkbox,
    checked = true,
  };

  local unchecked_checkbox = wibox.widget {
    widget = wibox.widget.checkbox,
    checked = false,
  };

  -- TODO: Only re-render the tag_widget, and not the entire bar
  local function render_wibar(s)
    local tag_widget = {
      layout = wibox.layout.flex.vertical,
    }

    -- Tag won't be selected on non-active screen
    if (s.selected_tag == nil) then return end

    for i = 1,#s.tags do
      local checkbox = wibox.widget.checkbox()

      if (i <= s.selected_tag.index) then
        checkbox.checked = true
      else
        checkbox.checked = false
      end

      local select_checkbox = function(lx, ly, button, mods, find_widgets_result)
        awful.tag.viewmore({s.tags[i]}, s)
      end

      checkbox:connect_signal("button::press", select_checkbox)

      table.insert(tag_widget, {
        checkbox,
        widget = wibox.container.margin,
        bottom = 10,
      })
    end

    s.systray = wibox.widget.systray()
    s.systray.set_horizontal(false)

    -- Add widgets to the wibox
    s.mywibar:setup {
      {
        layout = wibox.layout.align.vertical,
        tag_widget,
        {
          {
            widget = wibox.container.background,
          },
          layout = wibox.layout.flex.vertical,
        },
        {
          {
            {
              s.systray,
              layout = wibox.layout.align.vertical,
            },
            widget = wibox.container.margin,
            margins = 4
          },
          { widget = wibox.container.margin, bottom = 20 },
          s.mytextclock,
          layout = wibox.layout.fixed.vertical,
        },
      },
      widget = wibox.container.margin,
      margins = 10,
    }
  end

  render_wibar(s)

  -- Hide bar when a splash widget is visible
  awesome.connect_signal("widgets::splash::visibility", function(vis)
    screen.primary.mywibar.visible = not vis
  end)

  client.connect_signal("property::fullscreen", remove_wibar)

  client.connect_signal("request::unmanage", add_wibar)

  tag.connect_signal("property::selected", function(t) render_wibar(t.screen) end)
end)
