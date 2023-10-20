-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		python = {
			function()
				return {
					exe = "black",
					args = { "-" },
					stdin = true,
				}
			end,
		},

		java = {
			function()
				return {
					exe = "prettierd",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},

		json = {
			function()
				return {
					exe = "prettierd",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},

		javascript = {
			function()
				return {
					exe = "prettierd",
					args = {
						"--single-quote",
						"--search-parent-directories",
						"--stdin-filepath",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
					},
					stdin = true,
				}
			end,
		},

		typescript = {
			function()
				return {
					exe = "prettierd",
					args = { "--single-quote", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},

		javascriptreact = {
			function()
				return {
					exe = "prettierd",
					args = { "--single-quote", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},

		typescriptreact = {
			function()
				return {
					exe = "prettierd",
					args = { "--single-quote", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},

		vue = {
			function()
				return {
					exe = "prettierd",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},

		html = {
			function()
				return {
					exe = "prettierd",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},

		jinja = {
			function()
				return {
					exe = "prettierd",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},

		htmldjango = {
			function()
				return {
					exe = "prettierd",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},

		toml = {
			function()
				return {
					exe = "prettierd",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},

		yaml = {
			function()
				return {
					exe = "prettierd",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},

		markdown = {
			function()
				return {
					exe = "prettierd",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
