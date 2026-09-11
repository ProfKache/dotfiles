local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- Appearance
config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("DankMono Nerd Font", {
	weight = "Regular",
})

config.font_size = 19
config.line_height = 1.2

-- Use X11 instead of Wayland.
-- This avoids the startup sizing issue with Neovim on Pop!_OS.
config.enable_wayland = false

-- Window
config.window_decorations = "NONE"
config.window_background_opacity = 1

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- No WezTerm tab bar
config.enable_tab_bar = false

-- Terminal
config.scrollback_lines = 3500
config.adjust_window_size_when_changing_font_size = false

-- Disable audible bell
config.audible_bell = "Disabled"

-- Updates
config.check_for_updates = true

-- Key bindings
config.keys = {
	{
		key = "C",
		mods = "CTRL",
		action = act.CopyTo("ClipboardAndPrimarySelection"),
	},
	{
		key = "w",
		mods = "CTRL",
		action = act.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "q",
		mods = "WIN",
		action = act.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "k",
		mods = "CTRL",
		action = act.SendString("clear\n"),
	},
	{
		key = "Enter",
		mods = "SHIFT",
		action = act.SendKey({
			key = "j",
			mods = "CTRL",
		}),
	},
}

return config
