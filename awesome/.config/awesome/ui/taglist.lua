local awful = require("awful")
local wibox = require("wibox")
local naughty = require('naughty')
local gears = require("gears")
local beautiful = require('beautiful')

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local checked_checkbox = wibox.widget {
  widget = wibox.widget.checkbox,
  checked = true,
};

local unchecked_checkbox = wibox.widget {
  widget = wibox.widget.checkbox,
  checked = false,
};

local function render_taglist(s)
  s.taglist_widget = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    style   = {
      shape = gears.shape.circle,
    },
    layout   = {
      spacing = dpi(10),
      layout  = wibox.layout.fixed.vertical,
    },
    widget_template = {
      {
        {
          {
            margins = dpi(10),
            layout = wibox.container.margin,
          },
          id = 'background_role',
          shape = gears.shape.circle,
          layout = wibox.container.background,
        },
        margins = 0,
        layout = wibox.container.margin,
      },
      shape = gears.shape.circle,
      bg = beautiful.taglist_bg_normal,
      layout = wibox.container.background,
    },
    buttons = taglist_buttons
  }

  return wibox.widget {
    s.taglist_widget,
    margins = dpi(10),
    layout = wibox.container.margin,
  }
end

return render_taglist
