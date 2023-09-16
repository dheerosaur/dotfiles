vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

-- dheeraj/options
-- ===============
vim.cmd 'set directory=$HOME/.vim-swap/'
vim.cmd 'set viewdir=~/.vimviews'

local options = {
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  scrolloff = 5,

  autoindent = true,
  copyindent = true,
  breakindent = true,
  linebreak = true,
  wrap = true,
  backspace = 'indent,eol,start',

  ignorecase = true,
  smartcase = true,

  hlsearch = false,
  number = true,
  signcolumn = 'auto:2',
  list = false,
  viewoptions = 'folds,cursor',

  autochdir = false,
  shell = '/bin/bash',
  wildmenu = true,
  wildignore = '*.swp,*.pyc,*.class',
  undofile = true,
  updatetime = 250,
  termguicolors = true,
  completeopt = 'menuone,noselect',
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
