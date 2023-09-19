require("tokyonight").setup({
	style = "storm", -- night, storm, moon, day
	transparent = false,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		-- variables = { italic = true },
		string = {},
	},
})

require("tokyonight").load()
