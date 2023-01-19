local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
-- ============================================

local home = os.getenv("HOME")
local theme_path = string.format("%s/.config/awesome/theme/", os.getenv("HOME"))

-- Possible Wallpapers: anime.png, waves.jpg, desert.png, scenary.png

local primary_wallpaper = theme_path.."street_blues.png"
local secondary_wallpaper = theme_path.."scenary.png"
-- ============================================

beautiful.wallpaper = function (s)
  -- Primary monitor
  if (s.index == 1) then
    return primary_wallpaper
  end

  -- Secondary monitor(s)
  return secondary_wallpaper
end

local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)
    awful.tag({ "1", "2", "3", "4" }, s, awful.layout.layouts[default_layout])
end)
