return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup({
			render = "virtual", -- 'background'|'foreground'|'virtual'
			---Set virtual symbol (requires render to be set to 'virtual')
			virtual_symbol = "■",
			virtual_symbol_position = "inline", -- 'inline'|'eol'|'eow'
			---Highlight hex colors, e.g. '#FFFFFF'
			enable_hex = true,

			--- Highlight short hex colors e.g. '#fff'
			enable_short_hex = true,

			--- Highlight rgb colors, e.g. 'rgb(0 0 0)'
			enable_rgb = true,

			--- Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
			enable_hsl = true,

			--- Highlight CSS variables, e.g. 'var(--testing-color)'
			enable_var_usage = true,

			--- Highlight named colors, e.g. 'green'
			enable_named_colors = true,

			--- Highlight tailwind colors, e.g. 'bg-blue-500'
			enable_tailwind = true,
		})
	end,
}
