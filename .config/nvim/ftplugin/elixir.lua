require("lspconfig")["nextls"].setup({
	cmd = { "nextls", "--stdio" },
	init_options = {
		extensions = {
			credo = { enable = true },
		},
		experimental = {
			completions = { enable = true },
		},
	},
})
