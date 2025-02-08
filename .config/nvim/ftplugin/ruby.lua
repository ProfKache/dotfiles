local lspconfig = require("lspconfig")

lspconfig.solargraph.setup({
	mason = true, -- Let Mason handle it
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/solargraph", "stdio" },
	root_dir = function(fname)
		return require("lspconfig.util").find_git_ancestor(fname) or vim.fn.getcwd()
	end,
	settings = {
		solargraph = {
			diagnostics = true,
			formatting = true,
			completion = true,
			diagnostics_ignore = {
				"Lint/MissingMagicComment", -- Ignore the frozen string literal warning
				"Lint/UselessAssignment", -- Ignore unused assignments
			},
		},
	},
})
