return function()
  local index = require 'mason-registry.index'

  -- Registry overrides
  -- index['typescript-styled-plugin'] = 'user.mason-registry.ts-styled-plugin'
  require('mason-lspconfig').setup { automatic_installation = true }
  require('mason-null-ls').setup { automatic_installation = true }
end
