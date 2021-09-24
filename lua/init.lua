require('packages')

require('gsettings')
require('nvim-tree-settings')
require('bufferline_settings')
require('treesitter_settings')
require('telescope_settings')
require('dashboard_settings')
require('lualine_settings')
require('sneak_Qscope_settings')
require('theme_settings')
require('asynctasks_config')
-- require('autosession_settings')


--[[----------------------------------------------------------------------------
-- Here I will setup plugins that do not need too much configurations, so having
-- seperate file for them is not necessary.
------------------------------------------------------------------------------]]

require('gitsigns').setup()

-- setup colorizer 
--require'colorizer'.setup()

-- save all of my keymaps in one file
require('keymaps')
