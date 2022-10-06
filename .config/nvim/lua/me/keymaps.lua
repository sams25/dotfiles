local keymap = vim.api.nvim_set_keymap
-- (<mode>, <pattern>, <behaviour>, <option>)
local opts = { noremap = true, silent = true }

--Make sensible leaders
keymap("n", "'", ",", opts) -- Store behaviour of comma to single quote (')
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-------------
-- NORMAL ---
-------------

-- Making changes quickly
--keymap("n", "<leader>sv", ":luafile $MYVIMRC<CR>", opts) -- TODO: Fix

-- Saving and exiting are easy
keymap("n", "s", ":update<CR>", opts)
keymap("n", "Q", ":q<CR>", opts)

-- Better window navigation
keymap("n", "|", ":vsplit<CR>", opts)
keymap("n", "_", ":split<CR>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)

-- Command Behaviour
keymap("n", "<C-b>", ":make<CR>", opts)
keymap("n", "<leader>sh", ":terminal<CR>", opts)
keymap("n", "<leader><Space>", ":let @/ = \"\"<CR>", opts) -- clear search string

-- Spelling
keymap("n", "<leader>s", ":set spell!<CR>", opts)
--keymap("n", "<leader>sp", ":!aspell -c % <CR>", opts) -- TODO: Fix

-- Telescope
keymap("n", "fg", ":Telescope live_grep<CR>", opts)
keymap("n", "ff", ":Telescope find_files<CR>", opts)
keymap("n", "<C-t>", ":Telescope ", opts)

-------------
-- VISUAL ---
-------------

-- Stay in indent mode while moving things around
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Make a calculation
keymap("v", "<C-e>", ":!calc -p -d<CR>", opts)
-------------------
-- VISUAL BLOCK ---
-------------------

-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
