local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Frappe'

config.font = wezterm.font("Fira Code", { stretch = 'Expanded', weight = 'Medium' })
config.line_height = 1.2
config.cell_width = 1
config.font_size = 12.5
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.92
config.macos_window_background_blur = 20

config.initial_rows = 50
config.initial_cols = 250

config.window_padding = {
  left = 6, right = 6,
  top = 6, bottom = 6,
}

return config
