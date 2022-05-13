-- Standard awesome library
local gears = require("gears")
local gfs = require("gears.filesystem")
-- ============================================

-- Theme handling library
local themes_path = gfs.get_themes_dir()
local theme = dofile(themes_path .. "default/theme.lua")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- ============================================

theme.transparent   = "#00000000"

theme.icon_theme = "/usr/share/icons/Numix"

theme.font          = "sans 8"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

-- Checkbox
-- theme.checkbox_bg = "#bbbabc"
theme.checkbox_border_width = dpi(2)
theme.checkbox_border_color = "#bbbabc"
theme.checkbox_check_color = "#7499ad"
theme.checkbox_check_border_color = "#7499ad"
theme.checkbox_check_border_width = dpi(8)
theme.checkbox_color = "#bbbabc"
theme.checkbox_shape = gears.shape.circle
theme.checkbox_check_shape = gears.shape.circle

-- Systray
theme.systray_icon_spacing = dpi(10)
theme.bg_systray = "#1c1f27"

-- Gaps
theme.gap_single_client = true
theme.useless_gap = dpi(15)

theme.fade_duration = 250

theme.wibar_bg = "#1c1f27"

return theme
