require('plugins')

require('gsettings')
require('nvimtree_configs')
require('bufferline_configs')
require('treesitter_configs')
require('telescope_configs')
require('dashboard_configs')
require('lualine_configs')
require('sneakQscope_configs')
require('theme_configs')
require('asynctasks_configs')
-- require('sessionManage_configs')


--[[----------------------------------------------------------------------------
-- Here I will setup plugins that do not need too much configurations, so having
-- seperate file for them is not necessary.
------------------------------------------------------------------------------]]

require('gitsigns').setup()

-- setup colorizer
--require'colorizer'.setup()

-- save all of my keymaps in one file
require('mappings')