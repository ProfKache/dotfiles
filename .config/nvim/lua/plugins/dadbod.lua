return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql", "mongodb" }, lazy = true },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1 -- Pretty icons
		vim.g.db_ui_win_position = "left" -- Sidebar on the left
		vim.g.db_ui_show_database_icon = 1
		-- vim.g.db_ui_show_help = 0
	end,
}
