-- Set the leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- local ft = require("Comment.ft")

local set = vim.opt -- Set alias for global configurations
-- local setb = vim.bo -- Set alias for buffer configurations

-- For notifications
vim.notify = require("notify")

-----------------------------
-- UI CONFIGURATION
-----------------------------
set.nu = true --Show line numbers
set.relativenumber = true
set.showcmd = true -- Show command in the bottom bar
set.cursorline = true -- Highlight the current line
set.laststatus = 2 -- Always display the filename at the bottom
set.colorcolumn = "80"
set.autoindent = true

-- Setup colorscheme
-- vim.cmd([[ colorscheme darkplus ]])
-- vim.cmd([[ highlight Keyword gui=italic ]])
-- vim.cmd([[ highlight Identifier gui=italic ]])
-- vim.cmd([[ highlight Identifier gui=italic guifg=#D4D4D4 ]])

-- Setup the buffer line
set.termguicolors = true
-- Folding
-- set.foldmethod = "expr"
-- set.foldexpr = "nvim_treesitter#foldexpr()"

set.wrap = false
set.title = true -- change the terminal title
set.scrolloff = 7
set.hidden = true
set.showcmd = true
set.showmode = false -- We don't want to see things like -- INSERT -- anymore
set.clipboard = "unnamedplus"

set.cmdheight = 2 -- Give more space for  displaying messages.

set.joinspaces = true

set.updatetime = 700 -- Faster completion
set.timeoutlen = 500 -- By default timeoutlen is 1000 ms
set.ttimeoutlen = 0 -- sets the timeout for keycodes that start with a special key (like <Space>)

------------------------------------------
-- TABS, INDENTATION, SPACES, CONFIGURATION
------------------------------------------
set.expandtab = true -- tabs are spaces
set.tabstop = 4
set.softtabstop = 4 -- indent by 4 spaces when pressing tab
set.shiftwidth = 4
set.tabpagemax = 15 -- set the maximum number fo tabs to open
set.smartindent = true -- smart indentation

--------------------------------------------
-- SEARCH CONFIGURATION
--------------------------------------------
set.incsearch = true -- search as characters are entered i.e make search behave like modern brownsers
set.hlsearch = true -- highlight search
set.ignorecase = true -- ignore case when searching
set.smartcase = true -- ignore case if search pattern is all lowercase, case-sensitive otherwise
set.history = 1000 -- remember more commands and search history
set.undolevels = 1000 --use many muchos levels of undo

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

vim.cmd([[
au Bufread,BufNewFile,BufEnter *.{html,htmldjango} set shiftwidth=2 tabstop=2 noexpandtab
au Bufread,BufNewFile,BufEnter *.{js,jsx,ts,tsx,php} set shiftwidth=2 tabstop=2 noexpandtab cindent
au Bufread,BufNewFile,BufEnter *.vue set shiftwidth=2 tabstop=2
au Bufread,BufNewFile,BufEnter *.json set shiftwidth=2 tabstop=2 conceallevel=0
au Bufread,BufNewFile,BufEnter *.c set shiftwidth=4 tabstop=4 noexpandtab cindent
au Bufread,BufNewFile,BufEnter *.sql set shiftwidth=4 tabstop=4 noexpandtab
au BufNewFile,BufRead *.css set ts=2 sw=2
au BufNewFile,BufRead *.lua set ts=2 sw=2
au BufNewFile,BufRead *.scss set ft=scss.css
au BufRead,BufNewFile *.sbt set filetype=scala

au Bufread,BufNewFile *.kv set filetype=kivy shiftwidth=4 tabstop=4 softtabstop=4 expandtab ft.kivy='#%s'
]])

-- local ft = require("Comment.ft")
-- vim.cmd(string.format([[
--   au Bufread,BufNewFile *.kv set filetype=kivy shiftwidth=4 tabstop=4 softtabstop=4 expandtab %s='#%%s'
-- ]], ft))

-- let commentstring="# %s"

-- Enable json quotes to be displayed
vim.cmd([[
autocmd Filetype json let g:indentLine_setConceal = 0
]])

-- Disable E and W diagnostics
-- vim.cmd([[
-- let g:ale_lint_on_text_changed = 'never'
-- let g:ale_lint_on_insert_leave = 0
-- ]])

------------------------------------------------------------------------
--  Change emmet trigger key to ',' which will be ',,' for autocompletion
------------------------------------------------------------------------
vim.cmd([[
 let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}
]])

-- vim.cmd([[
-- let g:ale_fixers = {
-- \   '*': ['remove_trailing_lines', 'trim_whitespace'],
-- \   'javascript': ['eslint_d'],
-- \}
-- ]])

--[[

 let g:user_emmet_settings = {
 \  'html': {
 \    'snippets': {
 \      'html:5': '!!!+html[lang="en"]>(head>(meta[charset=${charset}]+meta[name="viewport" content="width=device-width,initial-scale=1.0"]+meta[http-equiv="X-UA-Compatible" content="ie=edge"]+title)) + body'
		\}
	\}
 \}
--]]

vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]])
