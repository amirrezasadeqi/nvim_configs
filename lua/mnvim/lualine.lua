local navic = require("nvim-navic")
local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
  return
end

local lualine_configs = {
  options = {
    theme = 'onedark'
    -- theme = 'tokyonight'
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
      { navic.get_location, condition = navic.is_available },
      -- { 'g:coc_status' },
    },
    lualine_x = {
      { 'diagnostics',
        sources = { "nvim_diagnostic" },
      },
    },
  },
  extensions = {
    -- 'fugitive',
    'nvim-tree',
    -- 'quickfix',
  }
}

local M = {}
function M.config()
  lualine.setup(lualine_configs)
end

return M
