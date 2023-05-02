return function(use)
  use 'github/copilot.vim'
  use 'int3/vim-extradite'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'editorconfig/editorconfig-vim'
  use 'andymass/vim-matchup'

  use {
    'princejoogie/dir-telescope.nvim',
    -- telescope.nvim is a required dependency
    requires = { 'nvim-telescope/telescope.nvim' },
    branch = 'dev',
    config = function()
      require('dir-telescope').setup {
        hidden = true,
        respect_gitignore = true,
      }
    end,
  }
end
