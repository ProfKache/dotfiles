return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- fancy icons
		"linrongbin16/lsp-progress.nvim",
	},
	opts = {
		options = {
			theme = "onedark", -- lualine theme
		},
	},
	sections = {
		lualine_c = {
			{
				"filename",
				file_status = true,
				newfile_status = false,
				path = 4, -- 0: Just filename, 1: Relative path, 2: Absolute Path 3: Absolute Path with tilde, 4: Filename and parent dir, with tilde.

				symbols = {
					modified = "[+]",
					readonly = "[-]",
				},
			},
		},
	},
}
