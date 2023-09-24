require 'user.defaults'
require 'user.keymaps'

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ''

require 'lazy.install'
require('lazy').setup 'plugins'

require 'user.setups'
require 'user.telescope'
require 'user.neo-tree'
require 'user.auto'
