------------------------------------------------------------------------------
--                              Lualine Configs
------------------------------------------------------------------------------

local gps = require("nvim-gps")


require('lualine').setup {
  options = {
    theme = 'onedark'
    -- theme = 'tokyodark'
    -- theme = 'tokyonight'
    -- theme = 'moonfly'
    -- theme = 'nightfox'
    -- theme = 'material-nvim'
    -- theme = 'onenord'
    -- theme = 'nord'
    -- theme = 'rose-pine'
    -- theme = 'dracula-nvim'
  },
  sections = {
    lualine_c = {
      { gps.get_location, condition = gps.is_available },
      {'g:coc_status'},
  	},
    lualine_x = {
      {'diagnostics',
        sources = {vim.g.wdig},
      },
    },
  },
  extensions = {
    'fugitive',
    'nvim-tree',
    'quickfix',
  }
}




