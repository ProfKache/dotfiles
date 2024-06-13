-- auto-completion of brackets/paren/quotes
return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
	opts = {
		check_ts = true,
		ts_config = {
			lua = { "string" }, -- it will not add a pair on that treesitter node
			javascript = { "template_string" },
		},
	},
}
