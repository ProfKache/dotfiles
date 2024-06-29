return {
	-- "navarasu/onedark.nvim",
	-- config = function()
	-- 	require("onedark").setup({
	-- 		style = "deep", -- deep, dark, darker, cool, warm, warmer
	-- 		transparent = false,
	-- 		code_style = {
	-- 			comments = "italic",
	-- 			keywords = "italic",
	-- 			functions = "none",
	-- 			variables = "none",
	-- 			string = "none",
	-- 		},
	-- 	})
	-- 	require("onedark").load()
	-- end,

	"catppuccin/nvim",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			transparent = false,
			styles = {
				comments = { "italic" },
				keywords = { "bold" },
				functions = { "italic" },
			},
		})
		require("catppuccin").load()
	end,
}
