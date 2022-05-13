-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")
-- ============================================

-- Standard awesome library
local awful = require("awful")
require("awful.autofocus")
-- ============================================

-- Theme handling library
local beautiful = require("beautiful")
-- ============================================

require("configuration");
-- ============================================

-- Auto run stuff
awful.spawn.with_shell("~/.config/awesome/autorun.sh")
-- ============================================

-- Setup Theme
local theme_path = string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME"))
beautiful.init(theme_path)
-- ============================================

require("ui");
-- ============================================

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)
