-- for searching through icons
return {
	"stevearc/dressing.nvim",
	dependencies = {
		"ziontee113/icon-picker.nvim",
	},
	config = function()
		require("icon-picker").setup({
			disable_legacy_commands = true,
		})
	end,
}
