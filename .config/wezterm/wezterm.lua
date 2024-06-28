local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

-- Maximize the window right away
wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize() -- this works for other operating systems
	-- window:gui_window():toggle_fullscreen() -- works for mac os
end)

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
	{ family = "BlexMono Nerd Font", scale = 1.45, weight = "Regular" },
	-- { family = "Operator Mono SSm Lig", scale = 1.45, weight = "Light" },
	-- { family = "FuraCode Nerd Font", scale = 1.4, weight = "Light" },
})

config.check_for_updates = true

-- Disable all noises
config.audible_bell = "Disabled"

config.keys = {
	{
		key = "C",
		mods = "CTRL",
		action = act.CopyTo("ClipboardAndPrimarySelection"),
	},
}

-- config.window_background_image = "/home/profkache/Pictures/term_wallpapers/pxfuel.jpg"
config.window_background_opacity = 1
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
config.adjust_window_size_when_changing_font_size = false

-- Open in full screen
config.initial_rows = 50
config.initial_cols = 200

return config
