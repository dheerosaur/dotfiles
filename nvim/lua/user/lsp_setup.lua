local Setup = {}
-- From: https://github.com/daliusd/cfg/blob/0e61894c689d736fa8c59ace8f149ecffb187cc4/.vimrc#L319-L332
local function filter(arr, fn)
  if type(arr) ~= 'table' then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.filename, '%.d.ts') == nil
end

local function on_list(options)
  -- https://github.com/typescript-language-server/typescript-language-server/issues/216
  local items = options.items
  if #items > 1 then
    items = filter(items, filterReactDTS)
  end

  vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
  vim.api.nvim_command 'cfirst'
end

Setup.lsp_definition = function()
  vim.lsp.buf.definition { on_list = on_list }
end

return Setup
