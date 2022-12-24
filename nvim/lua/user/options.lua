local options = {
  filetype = "off",
  hidden = true,
  ruler = false,
  laststatus = 2,
  number = true,
  relativenumber = false,
  autochdir = false,
  scrolloff = 5,
  viewdir = "$HOME/.vimviews",
  viewoptions = "folds,cursor",
  shell = "/bin/bash",
  wrap = true,
  list = false,
  backspace = 'indent,eol,start',
  expandtab = true,
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  linebreak = true,
  autoindent = true,
  copyindent = true,
  ignorecase = true,
  smartcase = true,
  incsearch = false,
  wildmenu = true,
  wildignore = "*.swp,*.pyc,*.class",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
