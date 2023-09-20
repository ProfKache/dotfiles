return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Package Manager
	use("nvim-tree/nvim-web-devicons")
	use("nvim-tree/nvim-tree.lua")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP

	--------------------------------------------------
	-- COLOR SCHEMES
	-- use("navarasu/onedark.nvim")
	use("folke/tokyonight.nvim")
	-- use("martinsione/darkplus.nvim")
	-- use("olimorris/onedarkpro.nvim")

	--------------------------------------------------

	use("rcarriga/nvim-notify") -- Notification plugin
	use("nvim-lualine/lualine.nvim")
	use("romgrk/barbar.nvim") -- A tabline plugin

	--------------------------------------------------
	--- TREESITTERS
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use("interdependence/tree-sitter-htmldjango")
	--------------------------------------------------

	--------------------------------------------------
	--- FUZZY FINDERS
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	--------------------------------------------------

	use("mfussenegger/nvim-jdtls")

	-- for searching through icons
	use("stevearc/dressing.nvim")
	use({
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = true,
			})
		end,
	})

	use("farfanoide/vim-kivy")

	use({
		"yorik1984/zola.nvim",
		requires = {
			"Glench/Vim-Jinja2-Syntax",
		},
	})

	-- Code Formatters
	-- use("jose-elias-alvarez/null-ls.nvim")
	-- use("lukas-reineke/lsp-format.nvim")
	use("mhartington/formatter.nvim")

	-- For commenting source code
	-- use("terrortylor/nvim-comment")
	use("numToStr/Comment.nvim")

	-- use("glepnir/dashboard-nvim") -- Neovim Dashboard.

	-- use("dense-analysis/ale") -- Linter for betty requirement
	-- use("JuanDAC/betty-ale-vim") -- Betty linter by holberton School

	-- EcmaScript and JSX
	use("pangloss/vim-javascript")
	use("maxmellon/vim-jsx-pretty")

	-- use("derekwyatt/vim-scala")
	use({ "scalameta/nvim-metals", requires = { "nvim-lua/plenary.nvim" } })

	use("mfussenegger/nvim-dap")

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use("lewis6991/gitsigns.nvim") -- Show lines upon git changes
	use("f-person/git-blame.nvim")

	-- Django plugins
	use("tweekmonster/django-plus.vim") -- Django extension for vim/nvim
	-- use("/mmontone/djula") -- Template engine for django

	-- use("integralist/vim-mypy") -- python static typing plugin

	use("jiangmiao/auto-pairs")

	-- use("echasnovski/mini.animate")

	------- Better Visual indentation
	-- use("Yggdroot/indentLine") -- Better Visual Guide
	use("lukas-reineke/indent-blankline.nvim")

	use("machakann/vim-highlightedyank") -- Highlight your yank area

	use("tpope/vim-fugitive") -- Git Integration
	-- use("tpope/vim-surround") -- Surrounding text plugin
	use({
		"kylechui/nvim-surround",
		-- tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	}) -- Surrounding text plugin

	-- Split/Join code blocks like arrays, dicts, functions etc.
	use({
		"Wansmer/treesj",
		requires = { "nvim-treesitter" },
		config = function()
			require("treesj").setup({ --[[ your config ]]
			})
		end,
	})

	-- Toggle the terminal for running application on the command line
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		-- config = function()
		-- 	require("toggleterm").setup()
		-- end,
	})

	use("mg979/vim-visual-multi") -- multi-cursor

	-- use({
	--   "tpope/vim-dadbod",
	--   opt = true,
	--   requires = {
	--     "kristijanhusak/vim-dadbod-ui",
	--     "kristijanhusak/vim-dadbod-completion",
	--   },
	--   config = function()
	--     require("config.dadbod").setup()
	--   end,
	--   cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
	-- })

	use("brenoprata10/nvim-highlight-colors")

	-- use("SirVer/ultisnips")
	-- use("mlaursen/vim-react-snippets") -- React Code Snippets
	-- use("morgsmccauley/vim-react-native-snippets") -- React Native code snippets

	-- Emmet
	use("mattn/emmet-vim")
	use({
		"dsznajder/vscode-es7-javascript-react-snippets",
		run = "yarn install --frozen-lockfile && yarn compile",
	})

	-- Code Runners
	use({ "michaelb/sniprun", run = "bash ./install.sh" })

	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin use 'neovim/nvim-lspconfig'
	use("onsails/lspkind.nvim") -- add pictograms on built-in lsp
end)
