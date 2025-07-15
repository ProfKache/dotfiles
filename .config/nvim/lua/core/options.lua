-- Set the leader key
vim.g.mapleader = " "
vim.g.have_nerd_font = true -- Set to false if you don't have nerd font installed

local set = vim.opt -- Set alias for global configuration

-----------------------------
-- UI CONFIGURATION
-----------------------------
set.number = true --Show line numbers
set.relativenumber = true
set.showcmd = true -- Show command in the bottom bar
set.cursorline = true -- Highlight the current line
set.laststatus = 2 -- Always display the filename at the bottom
set.colorcolumn = "80"
set.autoindent = true
set.signcolumn = "yes"
set.showmode = false -- Don't show the mode, e.g -- INSERT -- since it's already in the status line
set.termguicolors = true -- enable 256 colors
set.wrap = false
set.scrolloff = 10 -- Maximum number to lines to show before reaching the file bottom or top of the file.
set.showcmd = true -- Show the typed command.

-- Preview substitutions live, as you type!
set.inccommand = "split"

-- Enable break indent
set.breakindent = true

-- Highlight when yanking(copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking(copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

set.clipboard = "unnamed,unnamedplus" -- Enable access to system clipboard

--------------------------------------------
-- SEARCH CONFIGURATION
--------------------------------------------
set.incsearch = true -- search as characters are entered i.e make search behave like modern brownsers
set.hlsearch = true -- highlight search
set.ignorecase = true -- ignore case when searching
set.smartcase = true -- ignore case if search pattern is all lowercase, case-sensitive otherwise
set.history = 1000 -- remember more commands and search history
set.undolevels = 1000 -- use many much levels of undo

------------------------------------------
-- TABS, INDENTATION, SPACES, CONFIGURATION
------------------------------------------
set.expandtab = true -- tabs are spaces
set.tabstop = 4
set.softtabstop = 4 -- indent by 4 spaces when pressing tab
set.shiftwidth = 4
set.tabpagemax = 15 -- set the maximum number fo tabs to open
set.smartindent = true -- smart indentation

-- Decrease update time
set.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
set.timeoutlen = 300

-----------------------------------------
-- SPLIT MANAGEMENT
-----------------------------------------
set.splitbelow = true
set.splitright = true

-- Enable To move code UP or Down when in visual mode.
vim.cmd([[
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
]])

-- Some autocommands
vim.cmd([[
au Bufread,BufNewFile,BufEnter *.{html,htmldjango} set shiftwidth=2 tabstop=2 noexpandtab
au Bufread,BufNewFile,BufEnter *.{js,jsx,ts,tsx,php} set shiftwidth=2 tabstop=2 noexpandtab cindent
au Bufread,BufNewFile,BufEnter *.json set shiftwidth=2 tabstop=2 conceallevel=0
au Bufread,BufNewFile,BufEnter *.c set shiftwidth=4 tabstop=4 noexpandtab cindent
au Bufread,BufNewFile,BufEnter *.sql set shiftwidth=4 tabstop=4 noexpandtab
au BufNewFile,BufRead *.{css,lua,yaml,vue} set ts=2 sw=2
au BufNewFile,BufRead *.scss set ft=scss.css
au BufRead,BufNewFile *.sbt set filetype=scala

au Bufread,BufNewFile *.kv set filetype=kivy shiftwidth=4 tabstop=4 softtabstop=4 expandtab ft.kivy='#%s'
]])

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"**/templates/**/*.html", -- typical Django template path
		"**/templates/*.html", -- in case templates are at root
	},
	callback = function()
		vim.bo.filetype = "htmldjango"
	end,
})

-- Enable json quotes to be displayed
vim.cmd([[
autocmd Filetype json let g:indentLine_setConceal = 0
]])

-- Display diagnostics
vim.diagnostic.config({
	virtual_text = true, -- Enables inline text
})
