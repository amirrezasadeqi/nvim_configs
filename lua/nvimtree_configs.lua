require('nvim-tree').setup {
  open_on_setup = true,
  ignore_ft_on_setup = {'startify', 'dashboard'},
  --[[ When open nvim with no directory and open a project with telescope project plugin
  you need to toggle nvim tree twice to referesh the project tree but if you set 
  bellow options it will be ok. but i will leave them commented because the default
  is zero for bellow options and maybe cause some wierd behaviors in some situations
  (I didn't see any bad behavior yet!) and it is not annoying now. in future ... ]]
  -- update_cwd = true, -- I moved this option into setup function. the other option
                        -- is outside of setup function and is "nvim_tree_respect_buf_cwd".
}

-- vim.g.nvim_tree_respect_buf_cwd = 1



