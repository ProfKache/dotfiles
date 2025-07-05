local lspconfig = require("lspconfig")

lspconfig.solargraph.setup({
	mason = true, -- Let Mason handle it
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/solargraph", "stdio" },
	root_dir = function(fname)
		-- return require("lspconfig.util").find_git_ancestor(fname) or vim.fn.getcwd()
		return vim.fs.dirname(vim.fs.find({ fname, ".git" }, { upward = true })[1]) or vim.fn.getcwd()
	end,
	settings = {
		solargraph = {
			autoformat = true,
			diagnostics = true,
			formatting = true,
			completion = true,
			diagnostics_ignore = {
				"Style/FrozenStringLiteralComment", -- Ignore the frozen string literal warning
				"Lint/UselessAssignment", -- Ignore unused assignments
				"Style/StringLiterals", -- Ignore string interpolation (Single and Double quotes)
			},
		},
	},
})
