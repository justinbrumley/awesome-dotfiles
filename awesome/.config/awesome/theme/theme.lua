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

theme.font          = "Fira Sans 8"

theme.border_width = 0

theme.bg_normal     = "#121a18"
theme.bg_light      = "#15498a"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.notification_icon_size = dpi(64)

-- Taglist
theme.taglist_bg_focus = 'transparent'
theme.taglist_bg_urgent = 'transparent'

-- Systray
theme.systray_icon_spacing = dpi(10)
theme.bg_systray = theme.bg_normal

-- Gaps
theme.gap_single_client = true
theme.useless_gap = dpi(15)

theme.fade_duration = 250

-- theme.wibar_bg = theme.transparent

return theme
