require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"lua",
		"rust",
		"python",
		"java",
		"javascript",
		"typescript",
		"c_sharp",
		"cmake",
		"comment",
		"css",
		"dart",
		"dockerfile",
		"fish",
		"gitignore",
		"gitattributes",
		"go",
		"graphql",
		"html",
		"htmldjango",
		"json",
		"julia",
		"markdown",
		"php",
		"ruby",
		"solidity",
		"svelte",
		"swift",
		"todotxt",
		"toml",
		"tsx",
		"vim",
		"vue",
		"yaml",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	-- auto_install = true,

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = { enable = true, additional_vim_regex_highlighting = false },
	refactor = {
		highlight_definitions = { enable = true, clear_on_cursor_move = true },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<A-*>",
				goto_previous_usage = "<A-#>",
			},
		},
	},
})
