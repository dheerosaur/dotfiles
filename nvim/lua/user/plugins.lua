local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    use { "wbthomason/packer.nvim" }
    use { 'tpope/vim-fugitive' }
    use { 'int3/vim-extradite' }
    use { 'tyru/open-browser.vim' }
    use { 'tyru/open-browser-github.vim' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-unimpaired' }
    use { 'tpope/vim-repeat' }
    use { 'editorconfig/editorconfig-vim' }
    use { 'itchyny/lightline.vim' }
    use { 'altercation/vim-colors-solarized' }
    use { 'mattn/emmet-vim' }
    use { 'andymass/vim-matchup' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim', tag='0.1.0' }
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'nvim-treesitter/playground' }
    use({
        "princejoogie/dir-telescope.nvim",
        -- telescope.nvim is a required dependency
        requires = {"nvim-telescope/telescope.nvim"},
        branch = "dev",
        config = function()
            require("dir-telescope").setup({
                hidden = true,
                respect_gitignore = true,
            })
        end,
    })
end)
