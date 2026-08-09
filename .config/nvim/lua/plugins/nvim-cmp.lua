-- Autocompletion
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				-- Build Step is needed for regex support in snippets.
				-- This step is not supported in many windows environments.
				-- Remove the below condition to re-enable on windows.
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				-- `friendly-snippets` contains a variety of premade snippets.
				--    See the README about individual language/framework/plugin snippets:
				--    https://github.com/rafamadriz/friendly-snippets
				-- {
				--   'rafamadriz/friendly-snippets',
				--   config = function()
				--     require('luasnip.loaders.from_vscode').lazy_load()
				--   end,
				-- },
			},
		},
		"saadparwaiz1/cmp_luasnip",

		-- Adds other completion capabilities.
		--  nvim-cmp does not ship with all sources by default. They are split
		--  into multiple repos for maintenance purposes.
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
	},
	config = function()
		-- See `:help cmp`
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		luasnip.config.setup({})

		-- cmp.config.formatting = {
		-- 	format = require("tailwindcss-colorizer-cmp").formatter,
		-- }

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			completion = {
				completeopt = "menu,menuone,noinsert",
			},

			window = {
				completion = {
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
					scrollbar = false,
				},

				documentation = {
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,Search:None",
				},
			},

			mapping = cmp.mapping.preset.insert({
				-- your mappings...
			}),

			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			},

			formatting = {
				expandable_indicator = true,
				fields = { "kind", "abbr", "menu" },

				format = function(entry, vim_item)
					local kind = vim_item.kind

					-- Add lspkind icon
					local icon = lspkind.symbol_map[kind] or ""

					vim_item.kind = icon .. " " .. kind

					-- Tailwind colors
					vim_item = require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)

					return vim_item
				end,
			},
		})
	end,
}
