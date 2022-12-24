local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "\\", "<Nop>", opts)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Quick quitting
keymap("n", "<leader>q", ":q<CR>", opts)

-- Resize windows vertically
keymap('n', '<S-Right>', ':vertical:resize +5<CR>', opts)
keymap('n', '<S-Left>', ':vertical:resize -5<CR>', opts)
keymap('n', '<S-Up>', ':resize +5<CR>', opts)
keymap('n', '<S-Down>', ':resize -5<CR>', opts)

-- Splitting and closing windows
keymap('n', '<leader>v', '<C-w>v', opts)
keymap('n', '<leader>s', '<C-w>s', opts)
keymap('n', '<leader>x', '<C-w>c', opts)
keymap('n', '<leader>d', ':bp<CR>:bd#<CR>', opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Make Y behave like other capitals
keymap("n", "Y", "y$", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
