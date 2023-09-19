local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- Default mappings. Feel free to modify or remove as you wish.
	--
	-- BEGIN_DEFAULT_ON_ATTACH
	api.config.mappings.default_on_attach(bufnr)
	-- END_DEFAULT_ON_ATTACH

	-- Mappings migrated from view.mappings.list
	--
	-- You will need to insert "your code goes here" for any mappings with a custom action_cb
	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "T", api.node.open.tab, opts("Open: New Tab"))
	vim.keymap.set("n", "S", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "V", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "o", api.node.run.system, opts("Run System"))
end

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	git = {
		ignore = false,
	},
	view = {
		adaptive_size = false,
		-- mappings = {
		-- 	list = {
		-- 		{ key = "u", action = "dir_up" },
		-- 		{ key = "T", action = "tabnew" },
		-- 		{ key = "S", action = "split" },
		-- 		{ key = "V", action = "vsplit" },
		-- 		{ key = "?", action = "toggle_help" },
		-- 		{ key = "o", action = "system_open" },
		-- 	},
		-- },
	},
	renderer = {
		group_empty = false,
	},
	filters = {
		dotfiles = false,
	},
	disable_netrw = true,
	hijack_cursor = false,
	hijack_netrw = true,
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	on_attach = on_attach,
})
