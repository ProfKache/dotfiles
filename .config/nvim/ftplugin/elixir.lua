-- require("lspconfig").elixirls.setup({
-- 	cmd = { vim.fn.stdpath("data") .. "/mason/bin/elixir-ls" },
-- 	settings = {
-- 		elixirLS = {
-- 			dialyzerEnabled = true,
-- 			fetchDeps = false,
-- 		},
-- 	},
-- })

-- New syntax for elixir-ls
vim.lsp.config("elixirls", {
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/elixir-ls" },
	settings = {
		elixirLS = {
			dialyzerEnabled = true,
			fetchDeps = false,
		},
	},
})
