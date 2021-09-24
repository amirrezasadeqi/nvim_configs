vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }

-- When open nvim with no directory and open a project with telescope project plugin
-- you need to toggle nvim tree twice to referesh the project tree but if you set 
-- bellow options it will be ok. but i will leave them commented because the default
-- is zero for bellow options and maybe cause some wierd behaviors in some situations
-- (I didn't see any bad behavior yet!) and it is not annoying now. in future ...

--[[ vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_respect_buf_cwd = 1 ]]
