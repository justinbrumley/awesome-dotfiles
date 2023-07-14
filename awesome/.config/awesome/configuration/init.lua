-- This is used later as the default terminal and editor to run.
-- terminal = "xfce4-terminal"
terminal = "kitty"
browser = "firefox"
pulsemixer = "gtk-launch audio-mixer"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
-- ============================================

require('configuration.errors')
require('configuration.keys')
require('configuration.mouse')
require('configuration.rules')
-- ============================================

require('configuration.layout')
require('configuration.wallpaper')
