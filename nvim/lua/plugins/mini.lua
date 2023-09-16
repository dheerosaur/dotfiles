return {
  {
    'echasnovski/mini.surround',
    version = false,
    opts = {
      mappings = {
        add = 'yss',            -- Add surrounding in Normal and Visual modes
        delete = 'ysd',         -- Delete surrounding
        find = 'ysf',           -- Find surrounding (to the right)
        find_left = 'ysF',      -- Find surrounding (to the left)
        highlight = 'ysh',      -- Highlight surrounding
        replace = 'ysr',        -- Replace surrounding
        update_n_lines = 'ysn', -- Update `n_lines`
      },
    },
  },

  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    opts = {},
  },
}
