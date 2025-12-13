return {
	"navarasu/onedark.nvim",
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

	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent = true,
				styles = {
					comments = { "italic" },
					keywords = { "bold" },
					functions = {},
					conditionals = {},
					loops = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					-- notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
