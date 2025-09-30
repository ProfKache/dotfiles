return {
	"Jezda1337/nvim-html-css",
	dependencies = { "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" }, -- Use this if you're using nvim-cmp
	-- dependencies = { "saghen/blink.cmp", "nvim-treesitter/nvim-treesitter" }, -- Use this if you're using blink.cmp
	opts = {
		enable_on = { -- Example file types
			"html",
			"htmldjango",
			"tsx",
			"jsx",
			"erb",
			"svelte",
			"vue",
			"blade",
			"php",
			"templ",
			"astro",
		},
		handlers = {
			definition = {
				bind = "gd",
			},
			hover = {
				bind = "K",
				wrap = true,
				border = "none",
				position = "cursor",
			},
		},
		documentation = {
			auto_show = true,
		},
		vim.fn.globpath(vim.fn.getcwd(), "**/*.{css,scss,pcss,tailwind.css}", true, true), -- 🔥 expand all CSS files
	},
}
