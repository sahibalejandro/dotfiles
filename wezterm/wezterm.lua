local wezterm = require'wezterm'
local config = wezterm.config_builder()

-- Colors
config.color_scheme = '3024 (base16)'
config.colors = {
  background = 'black'
}

-- Fonts
config.font = wezterm.font'SFMono Nerd Font Mono'
config.font_size = 15
config.line_height = 1.6

--[[ Disable Font Ligatures if needed:
config.harfbuzz_features = {
  'calt=0',
  'clig=0',
  'liga=0',
}
]]--

-- Wezterm Apperance
config.hide_tab_bar_if_only_one_tab = true

-- Window
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.925
config.macos_window_background_blur = 20

return config
