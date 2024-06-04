require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"jdtls",
		"tsserver",
		"tailwindcss",
		"pyright",
		"pylsp",
		"yamlls",
		"cssls",
		"jsonls",
		"lemminx",
	},
	automatic_installation = true,
})
require("mason-lspconfig").setup_handlers({
	function(server_name)
		if server_name ~= "jdtls" then
			require("lspconfig")[server_name].setup({
				on_attach = function(client, bufnr) end,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end
	end,
})
require("mason-tool-installer").setup({
	-- Install these linters, formatters and debuggers automatically
	ensure_installed = {
		"java-debug-adapter",
		"java-test",
	},
})

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").sumneko_lua.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
