require('nvim-tree').setup {
  open_on_setup = true,
  ignore_ft_on_setup = {'startify', 'dashboard'},
  -- Bellow option is necessary for nvim tree to update when we use the custom
  -- defined command 'Cd'. if we don't set this option when we open neovim
  -- with 'nvim' command without specification of directory and then use the
  -- 'Cd' command or its keybinding the nvim tree will not update and just shows
  -- the HOME directory contents. In the past (Actually I have not checked it
  -- recently!) it was mentioned in the plugin repository that setting this option
  -- may lead to some weird or bad behaviors but till now I have not seen any weird
  -- situation. In future ...
  update_cwd = true,
}

-- vim.g.nvim_tree_respect_buf_cwd = 1



