-- Autoformat
return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			python = {
				-- "isort", "black"
				-- To fix auto-fixable lint errors.
				-- "ruff_fix",
				-- To run the Ruff formatter.
				"ruff_format",
				-- To organize the imports.
				"ruff_organize_imports",
			},
			go = { "gofumpt" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			java = { "google-java-format" },
			svelte = { "prettierd", "prettier" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			json = { "prettierd" },
			graphql = { "prettierd" },
			-- kotlin = { "ktlint" },
			-- ruby = { "standardrb" },
			markdown = { "prettierd" },
			-- erb = { "htmlbeautifier" },
			html = { "htmlbeautifier" },
			htmldjango = { "djlint" },
			bash = { "beautysh" },
			rust = { "rustfmt" },
			yaml = { "yamlfmt" },
			toml = { "taplo" },
			css = { "prettierd" },
			scss = { "prettierd" },
			ruby = { "rubyfmt" },
			erb = { "erb-formatter" },
		},
		-- formatters = {
		-- 	djlint = {
		-- 		command = "djlint",
		-- 		args = { "--reformat", "--indent", "2" },
		-- 		stdin = true,
		-- 	},
		-- },
	},
}
