-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', tag = 'legacy' },

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',

    requires = { 'nvim-lua/plenary.nvim' },
  }

  use {
    { 'williamboman/mason.nvim', config = require 'user.mason' },
    'williamboman/mason-lspconfig.nvim',
    'jayp0521/mason-null-ls.nvim',
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use 'rafamadriz/friendly-snippets'

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use 'nvim-treesitter/playground'

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  use 'folke/tokyonight.nvim'     -- Fancier statusline
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'numToStr/Comment.nvim'     -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth'          -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  use 'wuelnerdotexe/vim-astro'
  use 'pantharshit00/vim-prisma'
  use 'jose-elias-alvarez/typescript.nvim'

  use {
    'evanleck/vim-svelte',
    requires = { 'othree/html5.vim', 'pangloss/vim-javascript' },
  }

  use {
    'Pocco81/true-zen.nvim',
    config = function()
      require('true-zen').setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  }

  use {
    'nvim-pack/nvim-spectre',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use 'sindrets/diffview.nvim'

  use 'almo7aya/openingh.nvim'

  -- Unless you are still migrating, remove the deprecated commands from v1.x
  vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  }

  -- Add custom plugins to packer from ~/.config/nvim/lua/user/plugins.lua
  local has_plugins, plugins = pcall(require, 'user.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

local null_ls = require 'null-ls'

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.eslint.with { only_local = true },
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.code_actions.eslint,
    require 'typescript.extensions.null-ls.code-actions',
  },
}

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

require('spectre').setup()
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
  desc = 'Toggle Spectre',
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'auto:2'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme tokyonight-moon]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
    path = 1,
  },
}

-- Enable Comment.nvim
require('Comment').setup()

require('typescript').setup {
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false,            -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true,        -- fall back to standard LSP definition on failure
  },
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

vim.treesitter.language.register('markdown', 'mdx')

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'html', 'go', 'lua', 'python', 'rust', 'javascript', 'tsx', 'typescript', 'vimdoc', 'yaml' },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-space>',
      node_incremental = '<C-space>',
      scope_incremental = '<C-s>',
      node_decremental = '<bs>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {})

local LspSetup = require 'user.lsp_setup'

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  if client.name == 'tsserver' then
    client.server_capabilities.documentFormattingProvider = false
  end

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', LspSetup.lsp_definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('gK', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  gopls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  jsonls = {},
  cssls = {},
  yamlls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Turn on lsp status information
require('fidget').setup()

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ''

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_snipmate').lazy_load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      local copilot_keys = vim.fn['copilot#Accept']()
      if copilot_keys ~= '' and type(copilot_keys) == 'string' then
        vim.api.nvim_feedkeys(copilot_keys, 'i', true)
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'path' },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- dheeraj/options
-- ===============
vim.cmd 'set directory=$HOME/.vim-swap/'
vim.cmd 'set viewdir=~/.vimviews'

local options = {
  autochdir = false,
  scrolloff = 5,
  viewoptions = 'folds,cursor',
  shell = '/bin/bash',
  wrap = true,
  list = false,
  backspace = 'indent,eol,start',
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  linebreak = true,
  autoindent = true,
  copyindent = true,
  ignorecase = true,
  smartcase = true,
  wildmenu = true,
  wildignore = '*.swp,*.pyc,*.class',
}
--
for k, v in pairs(options) do
  vim.opt[k] = v
end

if vim.fn.filereadable '.lvimrc' == 1 then
  vim.cmd 'source .lvimrc'
end

if vim.fn.filereadable '.lvimrc.lua' == 1 then
  require '.lvimrc'
end

-- dheeraj/keymaps
-- ===============
require 'user.keymaps'

-- dheeraj/telescope
-- =================
-- See `:help telescope` and `:help telescope.setup()`
require 'user.telescope'

require 'user.neo-tree'

vim.cmd 'let g:python_host_prog = "~/.pyenv/versions/neovim2/bin/python"'
vim.cmd 'let g:python3_host_prog = "~/.pyenv/versions/neovim3/bin/python"'

vim.cmd 'au BufWinLeave ?* silent! mkview'
vim.cmd 'au BufWinEnter ?* silent! loadview'
vim.cmd 'au TabLeave ?* silent! mkview'
vim.cmd 'au TabEnter ?* silent! loadview'

-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
vim.cmd 'let g:astro_typescript = "enable"'
vim.cmd 'let g:astro_typescript = "enable"'
vim.cmd 'let g:astro_typescript = "enable"'

vim.filetype.add {
  extension = {
    mdx = 'mdx',
  },
}
