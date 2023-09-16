if vim.fn.filereadable '.lvimrc' == 1 then
  vim.cmd 'source .lvimrc'
end

if vim.fn.filereadable '.lvimrc.lua' == 1 then
  require '.lvimrc'
end

vim.cmd 'let g:python_host_prog = "~/.pyenv/versions/neovim2/bin/python"'
vim.cmd 'let g:python3_host_prog = "~/.pyenv/versions/neovim3/bin/python"'

vim.cmd 'au BufWinLeave ?* silent! mkview'
vim.cmd 'au BufWinEnter ?* silent! loadview'
vim.cmd 'au TabLeave ?* silent! mkview'
vim.cmd 'au TabEnter ?* silent! loadview'

-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

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
