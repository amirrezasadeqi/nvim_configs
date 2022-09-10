--[[###########################################################
--		              gutentags configs
--###########################################################]]

-- You can find explanations about these config options in bellow link:
-- https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/

local M = {}
function M.config()
  vim.g.gutentags_ctags_exclude = {
    '*.git', '*.svg', '*.hg',
    '*/tests/*',
    'build',
    'dist',
    '*sites/*/files/*',
    'bin',
    'node_modules',
    'bower_components',
    'cache',
    'compiled',
    'docs',
    'example',
    'bundle',
    'vendor',
    '*.md',
    '*-lock.json',
    '*.lock',
    '*bundle*.js',
    '*build*.js',
    '.*rc*',
    '*.json',
    '*.min.*',
    '*.map',
    '*.bak',
    '*.zip',
    '*.pyc',
    '*.class',
    '*.sln',
    '*.Master',
    '*.csproj',
    '*.tmp',
    '*.csproj.user',
    '*.cache',
    '*.pdb',
    'tags*',
    'cscope.*',
    -- '*.css',
    -- '*.less',
    -- '*.scss',
    '*.exe', '*.dll',
    '*.mp3', '*.ogg', '*.flac',
    '*.swp', '*.swo',
    '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
    '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
    '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
  }

  -- Using global or gtags_cscope which is a GNU port of cscope and works well.
  -- for now cscope support does not work properly. In future, if it will work
  -- well I will use 'cscope' instead of 'gtags_cscope' in bellow option. Till
  -- that time I will use another plugin for cscope.
  vim.g.gutentags_modules = { 'ctags', 'gtags_cscope' }
  -- vim.g.gutentags_modules = { 'ctags', 'cscope' }
  -- change focus to quickfix window after search (optional).
  vim.g.gutentags_plus_switch = true

  vim.g.gutentags_add_default_project_roots = false
  vim.g.gutentags_project_root = { 'package.json', '.git', 'compile_commands.json', '.root', '.catkin_workspace' }
  vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/nvim/tags/')
  vim.g.gutentags_generate_on_new = true
  vim.g.gutentags_generate_on_missing = true
  vim.g.gutentags_generate_on_write = true
  vim.g.gutentags_generate_on_empty_buffer = true
  vim.cmd([[command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')]])
  vim.g.gutentags_ctags_extra_args = { '--tag-relative=yes', '--fields=+ailmnS', }

  -- To solve: ERROR: gutentags: gtags-cscope job failed, returned: 1
  -- reset vim then run: ':GutentagsToggleTrace' and open some file and run ':GutentagsUpdate'
  -- you may see a lot of logs in messages or mess output.
  vim.g.gutentags_define_advanced_commands = true
end

return M
