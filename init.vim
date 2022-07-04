set nocompatible
syntax on
syntax enable


call plug#begin('~/.local/share/nvim/plugged')

"Plug 'davidhalter/jedi-vim'

" A fuzzy file finder
Plug 'kien/ctrlp.vim'

" Comment/Uncomment tool
Plug 'scrooloose/nerdcommenter'

Plug 'Xuyuanp/nerdtree-git-plugin'

" A Tree-like side bar for better navigation
Plug 'scrooloose/nerdtree'

" A cool status bar
Plug 'vim-airline/vim-airline'

" Airline themes
Plug 'vim-airline/vim-airline-themes'

" Better syntax-highlighting for filetypes in vim
Plug 'sheerun/vim-polyglot'

" Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git integration
Plug 'tpope/vim-fugitive'

" Surrounding text plugin
Plug 'tpope/vim-surround'

" Auto-close braces and scopes
Plug 'jiangmiao/auto-pairs'

" Emmet + vim
Plug 'mattn/emmet-vim'


" Better Visual Guide
Plug 'Yggdroot/indentLine'

Plug 'terryma/vim-multiple-cursors'


" Highlight your yank area
Plug 'machakann/vim-highlightedyank'

" Code Folding Plugin
" Plug 'tmhedberg/SimpylFold'

Plug 'leafOfTree/vim-vue-plugin'

Plug 'maxmellon/vim-jsx-pretty'
"Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'ap/vim-css-color'

Plug 'vim-syntastic/syntastic'

Plug 'yaegassy/coc-htmldjango', {'do': 'yarn install --frozen-lockfile'}

Plug 'farfanoide/vim-kivy'

Plug 'leafOfTree/vim-matchtag'

Plug 'https://github.com/rust-lang/rust.vim'

"Plug 'jackhub/toolbox.vim'
Plug 'vim-ruby/vim-ruby'

Plug 'APZelos/blamer.nvim'

" Python autocompletion plugin
"Plug 'davidhalter/jedi-vim'

"""""""""""""""""
" Color Schemes
"""""""""""""""""
Plug 'arcticicestudio/nord-vim'

" Using Vim-Plug
Plug 'navarasu/onedark.nvim'



call plug#end()

filetype plugin indent on

" Change the leader key
let mapleader = "," " map leader to comma


"""""""""""""""""""""""""""""
" UI CONFIGURATION
"""""""""""""""""""""""""""""
set nu "Show line numbers
" set relativenumber
set showcmd "Show command in the bottom bar
set cursorline "Highlight the current line
set laststatus=2 "Alway display the filename at the bottom
set nowrap
set title "change the terminal title
set scrolloff=5
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
set clipboard=unnamedplus
set colorcolumn=80
set signcolumn=yes
highlight ColorColumn ctermbg=238

" Give more space for  displaying messages.
 set cmdheight=2

" Don't pass messages to |ins=completion-menu|.
set shortmess+=c

"""""""
" New Settings 2022
"""""""
set updatetime=50                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms

set noshowmode                          " We don't need to see things like -- INSERT -- anymore

set guifont=Fira\ Code:h12


let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""""""""""""""""""
" TABS, INDENTATION, SPACES, CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""
set expandtab "tabs are spaces
set tabstop=4
set softtabstop=4 "indent by 4 spaces when pressing tab
set shiftwidth=4
set tabpagemax=15 "set the maximum number fo tabs to open
set ai "automic indentation
set si "smart indentation
set encoding=utf8


"""""""""""""""""""""""""""""
" COC CONFIGURATIONS
"""""""""""""""""""""""""""""

" Code action on <leader>a
vmap <leader>a <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a <Plug>(coc-codeaction-selected)<CR>
"nmap <leader>i <Plug>(coc-codeaction)

" Renaming a Symbol
nmap <leader>rn <Plug>(coc-rename)

" Goto definition
nmap <silent> gd <Plug>(coc-definition)

" Open definition in a new tab
nmap <silent> gv :tabe<CR><Plug>(coc-definition)<C-W>L

"let g:node_client_debug = 1

" NerdTree Configuration
map <leader>1 :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " Show hidden files in NerdTree buffer.

"let g:NERDTreeIndicatorMapCustom = {
    "\ "Modified"  : "✹",
    "\ "Staged"    : "✚",
    "\ "Untracked" : "✭",
    "\ "Renamed"   : "➜",
    "\ "Unmerged"  : "═",
    "\ "Deleted"   : "✖",
    "\ "Dirty"     : "✗",
    "\ "Clean"     : "✔︎",
    "\ 'Ignored'   : '☒',
    "\ "Unknown"   : "?"
    "\ }



"""""""""""""""""""""""""""""
" SPLIT MANAGEMENT
"""""""""""""""""""""""""""""
set splitbelow
set splitright

" Navigating between the Split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set background=dark
set t_Co=256
"colorscheme nord

"let g:onedark_style = 'cool'
"let g:onedark_italic_comment = v:true
let g:onedark_config = {
  \ 'style': 'cool',
  \ 'ending_tildes': v:true,
\ }
colorscheme onedark

" True Color Support if it's available in terminal
if has("termguicolors")
    set termguicolors
endif


" Create a transparent background in vim session
"hi! Normal ctermbg=NONE guibg=NONE
"hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
"hi normal guibg=000000



" Turn off backup
set nobackup
set noswapfile
set nowritebackup

"""""""""""""""""""""""""""""
" SEARCH CONFIGURATION
"""""""""""""""""""""""""""""
set incsearch " search as characters are entered
set hlsearch " highlight search
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
set history=1000 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" turn off ctrlp caching
let g:ctrlp_use_caching = 0





" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000



"""""""""""""""""""""""""""""
" CUSTOM MAPPINGS.
"""""""""""""""""""""""""""""
" Shortcut for opening nvim configuration file
nmap <leader>ev :tabe /home/profkache/.config/nvim/init.vim<CR>
map <leader><space> :noh<CR>

" Opening new tabs should be easier with ,t
map <leader>t :tabe<CR>

" Entering command mode with just a space
"nmap <space> :

" Mapping ; to :
nmap ; :

"Move back to normal mode from insert mode by typing ,e
imap <Leader>e <Esc>


" Git configurations
nmap <Leader>ga :Git add
nmap <Leader>gc :Git commit
nmap <Leader>go :Git checkout
nmap <Leader>gd :Git diff %<cr>
nmap <Leader>gp :Git push<cr>
nmap <Leader>gl :Git pull<cr>
nmap <Leader>gh :Git push heroku main<cr>
nmap <Leader>gst :Git status<cr>
nmap <Leader>gss :Git status -s<cr>
nmap <Leader>gb :Gblame<cr>
" nmap <Leader>lt :IndentLinesToggle<CR>


"-----------------------------------------------------------------"
" sometimes you open a readonly file in vim but you forget to run vim with sudo
" after making changes to it, thus you wont be able to save the file this is a trick to save it
"-----------------------------------------------------------------"
cmap w!! w !sudo tee % >/dev/null


" Disable Arrow keys
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>


" Enable To move code UP or Down when in visual mode.
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Configuration variables for certain syntax highlighting plugins
" (vim-javascript)
let g:javascript_plugin_jsdoc = 1

" Syntax highlighting for ngdocs
let g:javascript_plugin_ngdoc = 1

" Enable syntax highlighting for Flow
let g:javascript_plugin_flow = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change emmet trigger key to ',' which will be ',,' for autocompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_leader_key=','

let g:user_emmet_settings = {                                                                                                                                                             
\  'html': {                                                                                                                                                      
\    'snippets': {                                                                                                                                                
\      'html:5': '!!!+html[lang="en"]>(head>(meta[charset=${charset}]+meta[name="viewport" content="width=device-width,initial-scale=1.0"]+meta[http-equiv="X-UA-Compatible" content="ie=edge"]+title)) + body'                                                                                                                                                          
    \}                                                                                                                                                                
 \}                                                                                                                                                                
\}

"let g:coc_global_extensions = ['coc-python']



"""""""""""""""""""""""""""""
" Syntastic settings.
"""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.vue,*.svelte,*.jsp'



"""""""""""""""""""""""""""""
" Auto Commands.
"""""""""""""""""""""""""""""
au Bufread,BufNewFile,BufEnter *.{html,htmldjango} set shiftwidth=2 tabstop=2 noexpandtab
au Bufread,BufNewFile,BufEnter *.{js,jsx,ts,tsx} set shiftwidth=2 tabstop=2 noexpandtab cindent
au Bufread,BufNewFile,BufEnter *.php set shiftwidth=2 tabstop=2 noexpandtab cindent
au Bufread,BufNewFile,BufEnter *.vue set shiftwidth=2 tabstop=2
au Bufread,BufNewFile,BufEnter *.json set shiftwidth=2 tabstop=2
au Bufread,BufNewFile,BufEnter *.c set shiftwidth=4 tabstop=4 noexpandtab cindent
au BufNewFile,BufRead *.css set ai ts=2 sw=2
au BufNewFile,BufRead *.scss set ft=scss.css
"au BufNewFile,BufRead *.kv set shiftwidth=2 tabstop=2

"<-- KIVY SPECIFIC SETTINGS -->
" Kivy Highlighting
"au BufNewFile,BufRead *.kv

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
