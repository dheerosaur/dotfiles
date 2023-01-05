local kopts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "\\", "<Nop>", kopts)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Quick quitting
keymap("n", "<leader>q", ":q<CR>", kopts)

-- Resize windows vertically
keymap('n', '<S-Right>', ':vertical:resize +5<CR>', kopts)
keymap('n', '<S-Left>', ':vertical:resize -5<CR>', kopts)
keymap('n', '<S-Up>', ':resize +5<CR>', kopts)
keymap('n', '<S-Down>', ':resize -5<CR>', kopts)

-- Splitting and closing windows
keymap('n', '<leader>v', '<C-w>v', kopts)
keymap('n', '<leader>s', '<C-w>s', kopts)
keymap('n', '<leader>x', '<C-w>c', kopts)
keymap('n', '<leader>d', ':bp<CR>:bd#<CR>', kopts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", kopts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", kopts)

-- Make Y behave like other capitals
keymap("n", "Y", "y$", kopts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", kopts)
keymap("v", ">", ">gv", kopts)

-- fugitive
keymap("n", '<C-g>', ':Git<CR>', kopts)
keymap("n", '<leader>gd', ':Gdiff<CR>', kopts)
keymap("n", '<leader>gb', ':Git blame<CR>', kopts)
keymap("n", '<leader>gc', ':Git commit<CR>', kopts)
keymap("n", '<leader>gw', ':Gwrite<CR>', kopts)

vim.cmd('nmap <leader>bb :e $HOME/.bashrc<CR>')
vim.cmd('nmap <leader>ba :e $HOME/dotfiles/bash/aliases<CR>')
vim.cmd('nmap <leader>bc :e $HOME/dotfiles/bash/config<CR>')
vim.cmd('nmap <leader>bl :e $HOME/dotfiles/bash/localrc<CR>')

keymap('n', '<leader>l', ':set list!<CR>', kopts)
keymap('n', '<leader>2', ':setlocal ts=2 sts=2 sw=2 et<CR>', kopts)
keymap('n', '<leader>7', ':set tw=79<CR>', kopts)
keymap('n', '<leader>t', ':tabe<CR>', kopts)
keymap('n', '<leader>rc', ':tabe $MYVIMRC<CR>', kopts)
keymap('n', '<leader>rs', ':so $MYVIMRC<CR>', kopts)
keymap('n', '<leader>rt', ':tabe ~/.tmux.conf<CR>', kopts)

-- Copy to clipboard
keymap('v', '<leader>y', '"+y', kopts)
keymap('n', '<leader>Y', '"+yg_', kopts)
keymap('n', '<leader>y', '"+y', kopts)
keymap('n', '<leader>yy', '"+yy', kopts)

-- Paste from clipboard
keymap('n', '<leader>p', '"+p', kopts)
keymap('n', '<leader>P', '"+P', kopts)
keymap('v', '<leader>p', '"+p', kopts)
keymap('v', '<leader>P', '"+Package', kopts)
