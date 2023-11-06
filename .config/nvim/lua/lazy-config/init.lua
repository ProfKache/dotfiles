local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","

local plugins = {
	-- "christoomey/vim-tmux-navigator",
	"nvim-tree/nvim-web-devicons",
	"nvim-tree/nvim-tree.lua",

	{
		"ThePrimeagen/harpoon",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig", -- Configurations for Nvim LSP

	--------------------------------------------------
	-- COLOR SCHEMES
	"navarasu/onedark.nvim",
	{
		"folke/tokyonight.nvim",
		-- priority = 1000,
	},
	-- "martinsione/darkplus.nvim",
	-- "olimorris/onedarkpro.nvim",

	--------------------------------------------------

	"rcarriga/nvim-notify", -- Notification plugin
	"nvim-lualine/lualine.nvim",
	"romgrk/barbar.nvim", -- A tabline plugin

	--------------------------------------------------
	--- TREESITTERS
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-refactor",
	-- {
	-- 	"nvim-treesitter/nvim-treesitter-textobjects",
	-- 	dependencies = "nvim-treesitter/nvim-treesitter",
	-- },
	"interdependence/tree-sitter-htmldjango",
	--------------------------------------------------

	--------------------------------------------------
	--- FUZZY FINDERS
	{
		"nvim-telescope/telescope.nvim",
		-- version = "0.1.0",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	--------------------------------------------------

	"mfussenegger/nvim-dap",
	"mfussenegger/nvim-jdtls",

	-- for searching through icons
	"stevearc/dressing.nvim",
	{
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = true,
			})
		end,
	},

	"farfanoide/vim-kivy",

	{
		"yorik1984/zola.nvim",
		dependencies = {
			"Glench/Vim-Jinja2-Syntax",
		},
	},

	-- Code Formatters
	-- "jose-elias-alvarez/null-ls.nvim",
	-- "lukas-reineke/lsp-format.nvim",
	"mhartington/formatter.nvim",

	-- For commenting source code
	-- "terrortylor/nvim-comment",
	"numToStr/Comment.nvim",

	-- "glepnir/dashboard-nvim", -- Neovim Dashboard.

	-- "dense-analysis/ale", -- Linter for betty requirement
	-- "JuanDAC/betty-ale-vim", -- Betty linter by holberton School

	-- EcmaScript and JSX
	"pangloss/vim-javascript",
	"maxmellon/vim-jsx-pretty",

	-- "derekwyatt/vim-scala",
	{ "scalameta/nvim-metals", dependencies = { "nvim-lua/plenary.nvim" } },

	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- Git
	"lewis6991/gitsigns.nvim", -- Show lines upon git changes
	"f-person/git-blame.nvim",
	"tpope/vim-fugitive", -- Git Integration
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VeryLazy",
	-- 	init = function()
	-- 		vim.o.timeout = true
	-- 		vim.o.timeoutlen = 300
	-- 	end,
	-- 	opts = {
	-- 		-- your configuration comes here
	-- 		-- or leave it empty to use the default settings
	-- 		-- refer to the configuration section below
	-- 	},
	-- },

	-- Django plugins
	"tweekmonster/django-plus.vim", -- Django extension for vim/nvim
	"mmontone/djula", -- Template engine for django

	-- "integralist/vim-mypy", -- python static typing plugin

	"jiangmiao/auto-pairs",

	-- "echasnovski/mini.animate",

	------- Better Visual indentation
	-- "Yggdroot/indentLine", -- Better Visual Guide
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		dependencies = { "nvim-treesitter" },
	},

	"machakann/vim-highlightedyank", -- Highlight your yank area

	"tpope/vim-surround", -- Surrounding text plugin

	-- Surrounding text plugin

	-- "kylechui/nvim-surround",

	-- Split/Join code blocks like arrays, dicts, functions etc.
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter" },
		config = function()
			require("treesj").setup({ --[[ your config ]]
			})
		end,
	},

	-- Toggle the terminal for buildning application on the command line
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		-- config = function()
		-- 	require("toggleterm").setup()
		-- end,
	},

	"mg979/vim-visual-multi", -- multi-cursor

	-- {
	--   "tpope/vim-dadbod",
	--   lazy = true,
	--   dependencies = {
	--     "kristijanhusak/vim-dadbod-ui",
	--     "kristijanhusak/vim-dadbod-completion",
	--   },
	--   config = function()
	--     require("config.dadbod").setup()
	--   end,
	--   cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
	-- },

	"brenoprata10/nvim-highlight-colors",

	-- "SirVer/ultisnips"),
	-- "mlaursen/vim-react-snippets"), -- React Code Snippets
	-- "morgsmccauley/vim-react-native-snippets"), -- React Native code snippets

	-- Emmet
	"mattn/emmet-vim",
	{
		"dsznajder/vscode-es7-javascript-react-snippets",
		build = "yarn install --frozen-lockfile && yarn compile",
	},

	-- "github/copilot.vim",

	-- Code buildners
	-- { "michaelb/snipbuild", build = "bash ./install.sh" },

	-- Autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
	"hrsh7th/cmp-nvim-lua", -- LSP source for nvim-cmp
	"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp

	-- Snippets
	-- "L3MON4D3/LuaSnip", -- Snippets plugin use 'neovim/nvim-lspconfig'
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},

	"onsails/lspkind.nvim", -- add pictograms on built-in lsp
}

require("lazy").setup(plugins, {})
