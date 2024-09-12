local wezterm = require'wezterm'
local config = wezterm.config_builder()

-- Colors
config.color_scheme = 'tokyonight_night'

-- Fonts
config.font = wezterm.font'SFMono Nerd Font Mono'
config.font_size = 15
config.line_height = 1.6

-- Wezterm Apperance
config.hide_tab_bar_if_only_one_tab = true

-- Window
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.98
config.macos_window_background_blur = 10

return config
