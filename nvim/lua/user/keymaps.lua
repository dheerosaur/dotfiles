-- Shorten function name
local keymap = function(mode, key, result, desc)
  vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true, desc = desc })
end

-- Quick quitting
keymap('n', '<leader>q', ':q<CR>', 'Quit')
keymap('x', 'wq', '<C-z>', 'Write+Quit')

-- Resize windows vertically
keymap('n', '<S-Right>', ':vertical:resize +5<CR>', 'Resize right')
keymap('n', '<S-Left>', ':vertical:resize -5<CR>', 'Resize left')
keymap('n', '<S-Up>', ':resize +5<CR>', 'Resize up')
keymap('n', '<S-Down>', ':resize -5<CR>', 'Resize down')

-- Splitting and closing windows
keymap('n', '<leader>v', '<C-w>v', 'Split vertical')
keymap('n', '<leader>s', '<C-w>s', 'Split horizontal')
keymap('n', '<leader>x', '<C-w>c', 'Close window')
keymap('n', '<leader>d', ':bp<CR>:bd#<CR>', 'Delete buffer')

-- Move text up and down
keymap('n', '<A-j>', '<Esc>:m .+1<CR>==gi', 'Move line down')
keymap('n', '<A-k>', '<Esc>:m .-2<CR>==gi', 'Move line up')

-- Make Y behave like other capitals
keymap('n', 'Y', 'y$', 'Yank to end of line')

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', 'Indent and stay')
keymap('v', '>', '>gv', 'Indent and stay')

-- fugitive
keymap('n', '<C-g>', ':Git<CR>', 'Open fugitive')
keymap('n', '<leader>gd', ':Gdiff<CR>', 'Git diff')
keymap('n', '<leader>gb', ':Git blame<CR>', 'Git blame')
keymap('n', '<leader>gc', ':Git commit<CR>', 'Git commit')
keymap('n', '<leader>gw', ':Gwrite<CR>', 'Git write')

vim.cmd 'nmap <leader>bb :e $HOME/.bashrc<CR>'
vim.cmd 'nmap <leader>ba :e $HOME/dotfiles/bash/aliases<CR>'
vim.cmd 'nmap <leader>bc :e $HOME/dotfiles/bash/config<CR>'
vim.cmd 'nmap <leader>bl :e $HOME/dotfiles/bash/localrc<CR>'

keymap('n', '<leader>l', ':set list!<CR>', 'Toggle list')
keymap('n', '<leader>2', ':setlocal ts=2 sts=2 sw=2 et<CR>', 'Set tabs')
keymap('n', '<leader>7', ':set tw=79<CR>', 'Set text width')
keymap('n', '<leader>t', ':tabe<CR>', 'New tab')
keymap('n', '<leader>rc', ':tabe $MYVIMRC<CR>', 'Open vimrc')
keymap('n', '<leader>rs', ':so $MYVIMRC<CR>', 'Source vimrc')
keymap('n', '<leader>rt', ':tabe ~/.tmux.conf<CR>', 'Open tmux.conf')

-- Copy to clipboard
keymap('v', '<leader>y', '"+y', 'Copy to clipboard')
keymap('n', '<leader>y', '"+y', 'Copy to clipboard')
keymap('n', '<leader>yy', '"+yy', 'Copy line')
keymap('n', '<leader>Y', '"+yg_', 'Copy till end of line')

-- Paste from clipboard
keymap('n', '<leader>p', '"+p', 'Paste from clipboard')
keymap('n', '<leader>P', '"+P', 'Paste from clipboard')
keymap('v', '<leader>p', '"+p', 'Paste from clipboard')
keymap('v', '<leader>P', '"+Package', 'Paste from clipboard')

keymap('n', '<leader>R', ':%s/<C-r><C-w>//g<Left><Left>', 'Replace word under cursor')

keymap('n', '<leader>e', '<cmd>Neotree toggle<cr>', 'Neotree toggle')
keymap('n', '<Esc>', '<cmd>nohlsearch<cr>', 'Clear search')
keymap('n', ',r', ':Neotest run<CR>', 'Run test')

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})

vim.api.nvim_create_user_command('Depfix', ':! yarn depfix', { desc = 'Fixes dependencies' })

keymap('n', '<leader>e', '<cmd>Neotree toggle<cr>', 'Toggle Neotree')
keymap('n', '<Esc>', '<cmd>nohlsearch<cr>', 'Clear search')

-- diffview
keymap('n', ',gd', '<cmd>DiffviewOpen<CR>', 'diffview')
keymap('n', ',gm', '<cmd>DiffviewOpen master<CR>', 'diffview master')
