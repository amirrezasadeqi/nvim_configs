--[[----------------------------------------------------------------------------
-- Lualine related settings. also contains gps setting which works as a segment
-- of Lualine.
------------------------------------------------------------------------------]]

--Note: setup function needs to be called once for nvim-gps to work.
require('nvim-gps').setup()
local gps = require("nvim-gps")


require('lualine').setup {
  options = {
    theme = 'onedark'
    -- theme = 'tokyodark'
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
        -- sources = {'coc', 'nvim_lsp'},
        sources = {vim.g.wlsp},
      },
    },
  },
  extensions = {
    'fugitive',
    'nvim-tree',
    'quickfix',
  }
}




