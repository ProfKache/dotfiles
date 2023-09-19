require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "tsserver", "tailwindcss", "pyright", "pylsp" },
})

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").sumneko_lua.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
