-- This is used later as the default terminal and editor to run.
terminal = "xfce4-terminal"
browser = "firefox"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
-- ============================================

require('configuration.errors')
require('configuration.keys')
require('configuration.rules')
-- ============================================

require('configuration.layout')
require('configuration.wallpaper')
