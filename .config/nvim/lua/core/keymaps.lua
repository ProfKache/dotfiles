local set = vim.keymap.set
local opts = { noremap = true }

-- Navigating between the Split windows
set("n", "<C-j>", "<C-W>j", opts)
set("n", "<C-k>", "<C-W>k", opts)
set("n", "<C-h>", "<C-W>h", opts)
set("n", "<C-l>", "<C-W>l", opts)

set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source%<CR>", { desc = "Execute the current file" })

---------------------------
-- CUSTOM MAPPINGS.
----------------------------
-- Shortcut for opening nvim configuration file
-- map("n", "<leader>ev", ":tabe /home/profkache/.config/nvim/init.lua<CR>", opts)
set("n", ",<space>", ":noh<CR>", opts)

-- Saving and Quitting files
-- map("n", "<leader>w", ":w<CR>", opts)
-- map("n", "<leader>q", ":q!<CR>", opts)

-- map("n", "<leader>ps", ":PackerSync<CR>", opts)
-- map("n", "<leader>m", ":Mason<CR>", opts)
-- map("n", "<leader>l", ":LspInfo<CR>", opts)

-- Toogle nvim-tree
set("n", "<leader>1", ":NvimTreeToggle<CR>", opts)

-- Toogle treesj
set("n", "<leader>2", ":TSJToggle<CR>", opts)

-- Opening new tabs should be easier with ,t
set("n", "<leader>t", ":tabe<CR>", opts)

-- Entering command mode with just a space
-- nmap <space> :

-- Mapping ; to :
set("n", ";", ":", opts)

-- Move back to normal mode from insert mode by typing ,e
-- map("i", ",,", "<Esc>", opts)
-- map("i", ",,b", "<Esc>I", opts) -- Move to the beginning of the line while insert mode and enter insert mode
-- map("i", ",,e", "<Esc>A", opts) -- Move to the end of the line while insert mode and enter insert mode

-- Disable Arrow s --
set("n", "<Left>", "<NOP>", opts)
set("n", "<Right>", "<NOP>", opts)
set("n", "<Up>", "<NOP>", opts)
set("n", "<Down>", "<NOP>", opts)

-- Git configurations
set("n", "<Leader>ga", ":Git add", opts)
set("n", "<Leader>gc", ":Git commit", opts)
set("n", "<Leader>go", ":Git checkout", opts)
set("n", "<Leader>gp", ":Git push<cr>", opts)
set("n", "<Leader>gst", ":Git status<cr>", opts)
set("n", "<Leader>gb", ":Git blame<cr>", opts)

----------------------------
-- TOGGLETERM MAPPINGS.
----------------------------

-- LazyGit Mapping
set("n", "<leader>z", ":lua _LAZYGIT_TOGGLE()<CR>", opts)

-- LazyDocker Mapping
-- map("n", "<leader>d", ":lua _LAZYDOCKER_TOGGLE()<CR>", opts)

----------------------------
-- BARBAR MAPPINGS.
----------------------------

-- Move to previous/next buffer
set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
-- map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
-- map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
--
-- Pin/unpin buffer
set("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- Close buffer
set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
-- map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
-- map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
-- map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
-- map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

----------------------------
-- TELESCOPE MAPPINGS.
----------------------------

-- map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
-- map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
-- map("n", "<leader>fc", ":Telescope current_buffer_fuzzy_find<CR>", opts)
-- map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
-- map("n", "<leader>fm", ":Telescope harpoon marks<CR>")

----------------------------
-- DIAGNOSTIC KEYMAPS.
----------------------------
set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

----------------------------
-- HARPOON MAPPINGS.
----------------------------
set("n", "<leader>m", ":lua require('harpoon.mark').add_file()<CR>", opts)
set("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)

-- with emoji
set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register

-- wrap selection in JSON.stringify(*)
set("v", ",js", [[ cJSON.stringify(<c-r>")<esc> ]], { noremap = false })

-- wrap selection in JSON.parse(*)
set("v", ",jp", [[ cJSON.parse(<c-r>")<esc> ]], { noremap = false })

-- wrap selection in console.log
set("v", ",cl", [[ cconsole.log(<c-r>")<esc> ]], { noremap = false })

-- wrap selection in print
set("v", ",pr", [[ cprint(<c-r>")<esc> ]], { noremap = false })
set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register

-- Simple mapping for setting filetype to jinja.html
set("n", "<Leader>3", ":set filetype=jinja.html<CR>", opts) --> Yank the selected icon into register
set("n", "<leader>5", ":set filetype=htmldjango<CR>", opts) --> Yank the selected icon into register

-- Dismiss Noice Message
set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

-- Mappings for compiler.nvim plugin
-- Open compiler
vim.api.nvim_set_keymap("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap(
	"n",
	"<S-F6>",
	"<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
		.. "<cmd>CompilerRedo<cr>",
	{ noremap = true, silent = true }
)

-- Toggle compiler results
vim.api.nvim_set_keymap("n", "<S-F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
