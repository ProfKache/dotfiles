-- Set the leader key
vim.g.mapleader = ","

local setg = vim.opt -- Set alias for global configurations
local setb = vim.bo -- Set alias for buffer configurations

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Function for setting the maping of different keys
-- function map(mode, shortcut, command)
-- vim.api.nvim_set_keymap(mode, shortcut, command, opts)
-- end

-- Map key in normal mode
-- function nmap(shortcut, command)
  --  map('n', shortcut, command)
-- end

-- Map key in insert mode
-- function imap(shortcut, command)
 --  map('i', shortcut, command)
-- end

-- Map key in visual mode
-- function vmap(shortcut, command)
  -- map('v', shortcut, command)
-- end


-- setg.nocompatible = true
-- syntax on
-- syntax enable

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Plug 'davidhalter/jedi-vim'

-- A fuzzy file finder
Plug('kien/ctrlp.vim')

-- Comment/Uncomment tool
-- Plug 'scrooloose/nerdcommenter'

-- Plug 'Xuyuanp/nerdtree-git-plugin'

-- A Tree-like side bar for better navigation
-- Plug 'scrooloose/nerdtree'
Plug('kyazdani42/nvim-web-devicons') -- optional, for file icons
Plug('kyazdani42/nvim-tree.lua')
Plug ('nvim-lualine/lualine.nvim')
-- A cool status bar
-- Plug 'vim-airline/vim-airline'

-- Airline themes
-- Plug 'vim-airline/vim-airline-themes'

-- Better syntax-highlighting for filetypes in vim
-- Plug 'sheerun/vim-polyglot'

-- Intellisense engine
Plug('neoclide/coc.nvim', {branch = 'release'})

-- Git integration
Plug('tpope/vim-fugitive')

-- Surrounding text plugin
Plug('tpope/vim-surround')

-- Auto-close braces and scopes
Plug('jiangmiao/auto-pairs')

-- Emmet + vim
Plug('mattn/emmet-vim')


-- Better Visual Guide
Plug('Yggdroot/indentLine')

-- Plug 'terryma/vim-multiple-cursors'


-- Highlight your yank area
Plug('machakann/vim-highlightedyank')

-- Code Folding Plugin
-- Plug 'tmhedberg/SimpylFold'

Plug('leafOfTree/vim-vue-plugin')

Plug('maxmellon/vim-jsx-pretty')
-- Plug 'pangloss/vim-javascript'
-- Plug 'mxw/vim-jsx'
Plug('SirVer/ultisnips')
Plug('mlaursen/vim-react-snippets')

Plug('fatih/vim-go', {['do'] = ':GoUpdateBinaries' })

Plug('ap/vim-css-color')

Plug('vim-syntastic/syntastic')

Plug('yaegassy/coc-htmldjango', {['do'] = 'yarn install --frozen-lockfile'})

Plug('farfanoide/vim-kivy')

Plug('leafOfTree/vim-matchtag')

Plug('https://github.com/rust-lang/rust.vim')

-- Plug 'jackhub/toolbox.vim'
Plug('vim-ruby/vim-ruby')

Plug('APZelos/blamer.nvim')

-- Python autocompletion plugin
-- Plug 'davidhalter/jedi-vim'

-- Adding Linters
-- Plug 'neovim/nvim-lspconfig'
-- Plug 'jose-elias-alvarez/null-ls.nvim'
-- Plug 'MunifTanjim/eslint.nvim'


-----------------------------
-- BUFFERLINE
-----------------------------
-- Plug('akinsho/bufferline.nvim', {['tag'] = 'v2.*'})



----------------
-- Color Schemes
----------------
Plug('arcticicestudio/nord-vim')

Plug('navarasu/onedark.nvim')



vim.call('plug#end')

-- filetype plugin indent on

-- Change the leader key
-- let mapleader = "," " map leader to comma


-----------------------------
-- UI CONFIGURATION
-----------------------------
setg.nu = true --Show line numbers
-- set relativenumber
setg.showcmd = true -- Show command in the bottom bar
setg.cursorline = true -- Highlight the current line
setg.laststatus=2  -- Always display the filename at the bottom
setg.colorcolumn = '80'

-- Enable theme
require('onedark').setup {
    style = 'deep',
    transparent = false,
    code_style = {
      comments = "italic",
      keywords = "italic",
      functions = "none",
      variables = "italic",
      string = "none"
  },
}
require('onedark').load()

require('lualine').setup {
  options = {
    theme = 'onedark'
    -- ... your lualine config
  }
}

-- Setup the buffer line
setg.termguicolors = true
-- require("bufferline").setup{}

-- Enable mouse
vim.cmd('set mouse=a')

-- local null_ls = require("null-ls")
-- local eslint = require("eslint")

-- null_ls.setup()
--[[
--
eslint.setup({
  bin = 'eslint', -- or `eslint_d`
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
})

--]]
setg.wrap = false
setg.title = true  -- change the terminal title
setg.scrolloff = 7
setg.hidden = true
setg.showcmd = true
setg.showmode = false  -- We don't want to see things like -- INSERT -- anymore
-- setg.noshowmatch = true
-- setg.nolazyredraw = true
setg.clipboard = "unnamedplus"
-- setg.signcolumn=yes
-- highlight ColorColumn ctermbg=238

-- Give more space for  displaying messages.
setg.cmdheight=2

setg.joinspaces = true

-- Don't pass messages to |ins=completion-menu|.
-- set.shortmess+=c

------------------------
-- New Settings 2022
------------------------
setg.updatetime=700                      -- Faster completion
setg.timeoutlen=500                      -- By default timeoutlen is 1000 ms

-- set.noshowmode = true                          -- We don't need to see things like -- INSERT -- anymore 

-- set guifont=Fira\ Code:h12


-- let g:airline_powerline_fonts = 1


------------------------------------------
-- TABS, INDENTATION, SPACES, CONFIGURATION
------------------------------------------
setb.expandtab = true  -- tabs are spaces
setb.tabstop = 4
setb.softtabstop = 4  -- indent by 4 spaces when pressing tab
setb.shiftwidth = 4
-- setb.tabpagemax = 15 -- set the maximum number fo tabs to open
-- setb.autoindent = true -- automic indentation
setb.smartindent = true -- smart indentation
-- setb.encoding = utf8


--------------------------------
-- COC CONFIGURATIONS
--------------------------------

-- Code action on <leader>a
keymap('v', '<leader>a', '<Plug>(coc-codeaction-selected)<CR>', opts)
keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)<CR>', opts)
-- nmap <leader>i <Plug>(coc-codeaction)

--  Renaming a Symbol
keymap('n', '<leader>rn', '<Plug>(coc-rename', opts)

-- Goto definition
keymap('n', '<silent> gd', '<Plug>(coc-definition', opts)

-- Open definition in a new tab
keymap('n', '<silent> gv', ':tabe<CR><Plug>(coc-definition)<C-W>L', opts)

-- let g:node_client_debug = 1

-------------------------------------------
-- NVIMTREE CONFIGURATIONS
-------------------------------------------
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "T", action = "tabnew" },
      },
    },
  },
  renderer = {
    group_empty = true,
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
  }
})

keymap('n', '<leader>1', ':NvimTreeToggle<CR>', opts)

-- [[
-- map <leader>1 :NERDTreeToggle<CR>
-- let NERDTreeShowHidden=1 " Show hidden files in NerdTree buffer.

-- let g:NERDTreeIndicatorMapCustom = {
--     "\ "Modified"  : "✹",
--     "\ "Staged"    : "✚",
--    "\ "Untracked" : "✭",
--     "\ "Renamed"   : "➜",
--     "\ "Unmerged"  : "═",
--     "\ "Deleted"   : "✖",
--     "\ "Dirty"     : "✗",
--     "\ "Clean"     : "✔︎",
--     "\ 'Ignoret'   : '☒',
--    "\ "Unknown"   : "?"
--     "\ }
--     ]
--]]


--------------------
-- SPLIT MANAGEMENT
--------------------
setg.splitbelow = true
setg.splitright = true

-- Navigating between the Split windows
keymap('n', '<C-j>', '<C-W>j', opts)
keymap('n', '<C-k>', '<C-W>k', opts)
keymap('n', '<C-h>', '<C-W>h', opts)
keymap('n', '<C-l>', '<C-W>l', opts)


-- setg.background=dark
-- setg.t_Co=256
-- colorscheme nord

-- let g:onedark_style = 'cool'
-- let g:onedark_italic_comment = v:true
-- let g:onedark_config = {
--   \ 'style': 'cool',
--   \ 'ending_tildes': v:true,
-- \ }
-- colorscheme onedark

-- True Color Support if it's available in terminal
--- if has("termguicolors")
--     set termguicolors
-- endif


-- Create a transparent background in vim session
-- hi! Normal ctermbg=NONE guibg=NONE
-- hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
-- hi normal guibg=000000



--  Turn off backup
setg.backup = false
setg.swapfile = false
setg.writebackup = false

-------------------------
-- SEARCH CONFIGURATION
-------------------------
setg.incsearch = true -- search as characters are entered i.e make search behave like modern brownsers
setg.hlsearch = true -- highlight search
setg.ignorecase = true -- ignore case when searching
setg.smartcase = true -- ignore case if search pattern is all lowercase, case-sensitive otherwise
setg.history=1000 -- remember more commands and search history
setg.undolevels=1000  --use many muchos levels of undo

-- Ignore some folders and files for CtrlP indexing
vim.cmd([[
let g:ctrlp_custom_ignore = {
   \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
   \ 'file': '\.so$\|\.dat$|\.DS_Store$'
   \ }
]])

-- turn off ctrlp caching
-- let g:ctrlp_use_caching = 0





-- set highlight duration time to 1000 ms, i.e., 1 second
-- let g:highlightedyank_highlight_duration = 1000



----------------------------
-- CUSTOM MAPPINGS.
----------------------------
-- Shortcut for opening nvim configuration file
keymap('n', '<leader>ev', ':tabe /home/profkache/.config/nvim/init.lua<CR>', opts)
keymap('n', '<leader><space>', ':noh<CR>', opts)

-- Opening new tabs should be easier with ,t
keymap('n', '<leader>t', ':tabe<CR>', opts)

-- Entering command mode with just a space
-- nmap <space> :

-- Mapping ; to :
keymap('n', ';', ':', opts)

-- Move back to normal mode from insert mode by typing ,e
keymap('i', '<Leader>e', '<Esc>', opts)


-- Git configurations
keymap('n', '<Leader>ga', ':Git add', opts)
keymap('n', '<Leader>gc', ':Git commit', opts)
keymap('n', '<Leader>go', ':Git checkout', opts)
keymap('n', '<Leader>gd', ':Git diff %<cr>', opts)
keymap('n', '<Leader>gp', ':Git push<cr>', opts)
keymap('n', '<Leader>gh', ':Git push heroku main<cr>', opts)
keymap('n', '<Leader>gst', ':Git status<cr>', opts)
keymap('n', '<Leader>gss', ':Git status -s<cr>', opts)
keymap('n', '<Leader>gb', ':Git blame<cr>', opts)
-- nmap <Leader>lt :IndentLinesToggle<CR>


-----------------------------------------------------------------"
-- sometimes you open a readonly file in vim but you forget to run vim with sudo
-- after making changes to it, thus you wont be able to save the file this is a trick to save it
-----------------------------------------------------------------"
-- cmap w!! w !sudo tee % >/dev/null


-- Disable Arrow keys --
keymap('n', '<Left>', ':echo "no!"<cr>', opts)
keymap('n', '<Right>', ':echo "no!"<cr>', opts)
keymap('n', '<Up>', ':echo "no!"<cr>', opts)
keymap('n', '<Down>', ':echo "no!"<cr>', opts)


-- Enable To move code UP or Down when in visual mode.
vim.cmd([[
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
]])


-- Configuration variables for certain syntax highlighting plugins
-- (vim-javascript) --
-- let g:javascript_plugin_jsdoc = 1

-- Syntax highlighting for ngdocs
-- let g:javascript_plugin_ngdoc = 1

-- Enable syntax highlighting for Flow --
-- let g:javascript_plugin_flow = 1


------------------------------------------------------------------------
--  Change emmet trigger key to ',' which will be ',,' for autocompletion
------------------------------------------------------------------------
-- let g:user_emmet_leader_key=','

-- let g:user_emmet_settings = {                                                                                                                                                             
-- \  'html': {                                                                                                                                                      
-- \    'snippets': {                                                                                                                                                
-- \      'html:5': '!!!+html[lang="en"]>(head>(meta[charset=${charset}]+meta[name="viewport" content="width=device-width,initial-scale=1.0"]+meta[http-equiv="X-UA-Compatible" content="ie=edge"]+title)) + body'                                                                                                                                                          
--    \}                                                                                                                                                                
--  \}                                                                                                                                                                
-- \}

-- let g:coc_global_extensions = ['coc-python'] -- this was commented



------------------------------
-- Syntastic settings.
------------------------------
-- set statusline+=%#warningmsg#
-- set statusline+=%{SyntasticStatuslineFlag()}
-- set statusline+=%*

--[[
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.vue,*.svelte,*.jsp'
--]]


------------------------------
-- Auto Commands.
------------------------------
vim.cmd([[
au Bufread,BufNewFile,BufEnter *.{html,htmldjango} set shiftwidth=2 tabstop=2 noexpandtab
au Bufread,BufNewFile,BufEnter *.{js,jsx,ts,tsx} set shiftwidth=2 tabstop=2 noexpandtab cindent
au Bufread,BufNewFile,BufEnter *.php set shiftwidth=2 tabstop=2 noexpandtab cindent
au Bufread,BufNewFile,BufEnter *.vue set shiftwidth=2 tabstop=2
au Bufread,BufNewFile,BufEnter *.json set shiftwidth=2 tabstop=2
au Bufread,BufNewFile,BufEnter *.c set shiftwidth=4 tabstop=4 noexpandtab cindent
au BufNewFile,BufRead *.css set ai ts=2 sw=2
au BufNewFile,BufRead *.lua set ai ts=2 sw=2
au BufNewFile,BufRead *.scss set ft=scss.css
]])

-- au BufNewFile,BufRead *.kv set shiftwidth=2 tabstop=2

--[[
--
"<-- KIVY SPECIFIC SETTINGS -->
" Kivy Highlighting
"au BufNewFile,BufRead *.kv
--

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tool tip documentation and diagnostics
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! ShowDocIfNoDiagnostic(timer_id)
  "if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    "silent call CocActionAsync('doHover')
  "endif
"endfunction

"function! s:show_hover_doc()
  "call timer_start(500, 'ShowDocIfNoDiagnostic')
"endfunction

"autocmd CursorHoldI * :call <SID>show_hover_doc()
"autocmd CursorHold * :call <SID>show_hover_doc()

--]]
