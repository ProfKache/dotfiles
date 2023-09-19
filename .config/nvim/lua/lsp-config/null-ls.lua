local null_ls = require("null-ls")

-- local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics.eslint

-- register any number of sources simultaneously
local sources = {
	formatting.eslint_d,
	-- formatting.autopep8,
	formatting.black,
	formatting.stylua,
	formatting.beautysh,
	-- formatting.blade_formatter,
	-- formatting.cmake_format,
	-- formatting.codespell,
	-- formatting.djhtml,
	-- formatting.djlint,
	formatting.fish_indent,
	formatting.goimports,
	formatting.gofmt,
	formatting.goimports_reviser,
	formatting.nginx_beautifier,
	formatting.pg_format,
	-- formatting.phpcsfixer,
	formatting.prettierd.with({
		filetypes = {
			"html",
			"yaml",
			"toml",
			"markdown",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
		},
		-- command = "prettierd",
		args = { "--end-without-tag" },
	}),
	formatting.yamlfmt,

	-- Diagnostics
	diagnostics.fish,
	diagnostics.mypy,
	diagnostics.pycodestyle,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8+, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				-- vim.lsp.buf.formatting_sync()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
