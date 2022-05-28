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

theme.icon_theme = "/usr/share/icons/ePapirus"

theme.font          = "sans 8"

theme.bg_normal     = "#222222"
theme.bg_light      = "#2E3340"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

-- Taglist
theme.taglist_bg_normal = '#bbbabc'
theme.taglist_bg_focus = '#7dc2d5'

-- Systray
theme.systray_icon_spacing = dpi(10)
theme.bg_systray = theme.bg_light

-- Gaps
theme.gap_single_client = true
theme.useless_gap = dpi(15)

theme.fade_duration = 250

theme.wibar_bg = "#1c1f27"

return theme
