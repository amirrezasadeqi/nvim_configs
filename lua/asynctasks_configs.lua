--[[ ####################################################################
  			asynctasks configs
#################################################################### ]]

--[[ And quickfix window can be opened automatically, otherwise you can't
see the task output unless using :copen manually. ]]

vim.g.asyncrun_open = 6
vim.g.asyncrun_rootmarks = { '.git', '.svn', '.root', '.project', '.hg', '.vim', 'compile_commands.json', '.catkin_workspace' }
vim.g.asynctasks_profile = "zsh"
--[[ vim.g.asynctasks_term_pos = "bottom"
vim.g.asynctasks_term_rows = 10
vim.g.asynctasks_term_cols = 80 ]]

