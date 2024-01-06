return {
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', tag = 'legacy' },

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },

  {
    'jose-elias-alvarez/null-ls.nvim',

    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'jayp0521/mason-null-ls.nvim',

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  'rafamadriz/friendly-snippets',

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  'nvim-treesitter/playground',

  { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',
  'sindrets/diffview.nvim',
  'almo7aya/openingh.nvim',

  'nvim-lualine/lualine.nvim', -- Fancier statusline
  'tpope/vim-sleuth',          -- Detect tabstop and shiftwidth automatically
  'folke/zen-mode.nvim',

  'jose-elias-alvarez/typescript.nvim',

  'github/copilot.vim',
  'int3/vim-extradite',
  'tpope/vim-unimpaired',
  'tpope/vim-repeat',
  'editorconfig/editorconfig-vim',
  'andymass/vim-matchup',

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'haydenmeade/neotest-jest',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-jest' {
            jestCommand = 'jest --watch',
            jestConfigFile = 'jest.config.ts',
            env = { CI = true },
            cwd = function(path)
              local file = vim.fn.expand '%:p'
              if string.find(file, '/packages/') then
                print(string.match(file, '(.-/[^/]+/)online-visit') .. 'online-visit')
                return string.match(file, '(.-/[^/]+/)online-visit') .. 'online-visit'
              end
              return vim.fn.getcwd()
            end,
          },
        },
      }
    end,
  },

  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  { 'akinsho/toggleterm.nvim', version = '*', config = true },

  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    config = function()
      require('chatgpt').setup()
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
  {
    'robitx/gp.nvim',
    config = function()
      require('gp').setup {
        hooks = {
          ImportByFile = function(gp, params)
            local template = 'Having following code that imports components from a single export file'
                .. '```{{selection}}\n```\n\n'
                .. 'Split them into separate lines importing from their own files like this:\n\n'
                .. "```import { Paragraph } from '@healthbyro/design-system/Paragraph}'\n```\n\n"
            gp.Prompt(params, gp.Target.rewrite, nil, gp.config.command_model, template, gp.config.command_system_prompt)
          end,
          EnzymeToRTL = function(gp, params)
            local template = 'Having following enzyme test code from {{filename}}:\n\n'
                .. '```{{filetype}}\n{{selection}}\n```\n\n'
                .. 'Write the tests using react-testing-library.\n'
            gp.Prompt(params, gp.Target.rewrite, nil, gp.config.command_model, template, gp.config.command_system_prompt)
          end,
          ReactFunctional = function(gp, params)
            local template = 'Having following React class based component from {{filename}}:\n\n'
                .. '```{{filetype}}\n{{selection}}\n```\n\n'
                .. 'Rewrite it as a functional component using TypeScript. Prefer named functions over arrow functions'
            gp.Prompt(params, gp.Target.rewrite, nil, gp.config.command_model, template, gp.config.command_system_prompt)
          end,
        },
      }
    end,
  },
}
