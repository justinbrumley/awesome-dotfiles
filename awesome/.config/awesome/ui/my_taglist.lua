local awful = require("awful")
local gears = require("gears")
local gfs = gears.filesystem
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
------------------------------------

local get_taglist = function(s)
    local unfocus_icon = ""
    local unfocus_color = "#9e9d9e"

    local empty_icon = ""
    local empty_color = "#9e9d9e"

    local focus_icon = ""
    local focus_color = "#9e9d9e"

    ----------------------------------------------------------------------

    -- Function to update the tags
    local update_tags = function(self, c3)
      local tagicon = self:get_children_by_id('icon_role')[1]
      if c3.selected then
        tagicon.text = focus_icon
        self.fg = focus_color
      elseif #c3:clients() == 0 then
        tagicon.text = empty_icon
        self.fg = empty_color
      else
        tagicon.text = unfocus_icon
        self.fg = unfocus_color
      end
    end

    ----------------------------------------------------------------------

    local icon_taglist = awful.widget.taglist {
      screen = s,
      filter = awful.widget.taglist.filter.all,
      style = {
        -- Without the style.shape set to circle, we get a weird square in the corner
        shape = gears.shape.circle,
      },
      layout = {
        spacing = 0,
        layout = wibox.layout.fixed.vertical,
      },
      widget_template = {
        {
          {
            id = 'icon_role',
            font = "JetBrainsMono Nerd Font 16",
            widget = wibox.widget.textbox,
          },
          id = 'margin_role',
          widget = wibox.container.margin,
          left = dpi(16),
          right = dpi(16),
          align = 'center',
        },
        id = 'background_role',
        widget = wibox.container.background,
        create_callback = function(self, c3, index, objects)
          update_tags(self, c3)
        end,

        update_callback = function(self, c3, index, objects)
          update_tags(self, c3)
        end
      },
      buttons = taglist_buttons
    }

    return icon_taglist
  end

  return get_taglist
