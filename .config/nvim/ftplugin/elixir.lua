-- require("lspconfig")["nextls"].setup({
-- 	cmd = { "nextls", "--stdio" },
-- 	init_options = {
-- 		extensions = {
-- 			credo = { enable = true },
-- 		},
-- 		experimental = {
-- 			completions = { enable = true },
-- 		},
-- 	},
-- })

require("lspconfig").elixirls.setup({
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/elixir-ls" },
	settings = {
		elixirLS = {
			dialyzerEnabled = true,
			fetchDeps = false,
		},
	},
})
