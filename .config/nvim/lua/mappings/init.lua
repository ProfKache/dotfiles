-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set
local opts = { noremap = true }

-- Navigating between the Split windows
map("n", "<C-j>", "<C-W>j", opts)
map("n", "<C-k>", "<C-W>k", opts)
map("n", "<C-h>", "<C-W>h", opts)
map("n", "<C-l>", "<C-W>l", opts)

----------------------------
-- CUSTOM MAPPINGS.
----------------------------
-- Shortcut for opening nvim configuration file
map("n", "<leader>ev", ":tabe /home/profkache/.config/nvim/init.lua<CR>", opts)
map("n", "<leader><space>", ":noh<CR>", opts)

-- Saving and Quitting files
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q!<CR>", opts)

-- Source a luafile
map("n", "<leader>s", ":luafile %<CR>", opts)
map("n", "<leader>ps", ":PackerSync<CR>", opts)
map("n", "<leader>m", ":Mason<CR>", opts)
map("n", "<leader>l", ":LspInfo<CR>", opts)

-- Toogle nvim-tree
map("n", "<leader>1", ":NvimTreeToggle<CR>", opts)

-- Toogle treesj
map("n", "<leader>2", ":TSJToggle<CR>", opts)

-- Opening new tabs should be easier with ,t
map("n", "<leader>t", ":tabe<CR>", opts)

-- Entering command mode with just a space
-- nmap <space> :

-- Mapping ; to :
map("n", ";", ":", opts)

-- Move back to normal mode from insert mode by typing ,e
map("i", "<Leader>e", "<Esc>", opts)

-- Disable Arrow s --
map("n", "<Left>", ':echo "Disabled!"<cr>', opts)
map("n", "<Right>", ':echo "Disabled!"<cr>', opts)
map("n", "<Up>", ':echo "Disabled!"<cr>', opts)
map("n", "<Down>", ':echo "Disabled!"<cr>', opts)

-- Git configurations
map("n", "<Leader>ga", ":Git add", opts)
map("n", "<Leader>gc", ":Git commit", opts)
map("n", "<Leader>go", ":Git checkout", opts)
map("n", "<Leader>gd", ":Git diff %<cr>", opts)
map("n", "<Leader>gp", ":Git push<cr>", opts)
map("n", "<Leader>gh", ":Git push heroku main<cr>", opts)
map("n", "<Leader>gst", ":Git status<cr>", opts)
map("n", "<Leader>gss", ":Git status -s<cr>", opts)
map("n", "<Leader>gb", ":Git blame<cr>", opts)

----------------------------
-- TOGGLETERM MAPPINGS.
----------------------------

-- LazyGit Mapping
map("n", "<leader>z", ":lua _LAZYGIT_TOGGLE()<CR>", opts)

-- LazyDocker Mapping
map("n", "<leader>d", ":lua _LAZYDOCKER_TOGGLE()<CR>", opts)

----------------------------
-- BARBAR MAPPINGS.
----------------------------

-- Move to previous/next buffer
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

----------------------------
-- TELESCOPE MAPPINGS.
----------------------------

map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fc", ":Telescope current_buffer_fuzzy_find<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- with emoji
map("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
map("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register

----------------------------
-- DATABASE MAPPINGS.
----------------------------
-- map("n", "<leader>u", "<Cmd>DBUIToggle<Cr>", opts)
-- map("n", "<leader>f", "<Cmd>DBUIFindBuffer<Cr>", opts)
-- map("n", "<leader>r", "<Cmd>DBUIRenameBuffer<Cr>", opts)
-- map("n", "<leader>q", "<Cmd>DBUILastQueryInfo<Cr>", opts)

-- D = {
--   name = "Database",
--   u = { "<Cmd>DBUIToggle<Cr>", "Toggle UI" },
--   f = { "<Cmd>DBUIFindBuffer<Cr>", "Find buffer" },
--   r = { "<Cmd>DBUIRenameBuffer<Cr>", "Rename buffer" },
--   q = { "<Cmd>DBUILastQueryInfo<Cr>", "Last query info" },
-- }
