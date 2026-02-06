return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-h>", ":TmuxNavigateLeft<cr>" },
		{ "<c-j>", ":TmuxNavigateDown<cr>" },
		{ "<c-k>", ":TmuxNavigateUp<cr>" },
		{ "<c-l>", ":TmuxNavigateRight<cr>" },
		{ "<c-\\>", ":TmuxNavigatePrevious<cr>" },
	},
}
