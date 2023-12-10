local wezterm = require("wezterm")
local config = {}

-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
-- config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Tokyo Night Storm"
config.line_height = 1.25
config.font = wezterm.font_with_fallback({
	{ family = "Operator Mono Lig", scale = 1.5, weight = "Light" },
	-- { family = "FuraCode Nerd Font", scale = 1.4, weight = "Light" },
})
-- config.window_background_image = "/home/profkache/Pictures/term_wallpapers/pxfuel.jpg"
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.scrollback_lines = 3500
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

return config
