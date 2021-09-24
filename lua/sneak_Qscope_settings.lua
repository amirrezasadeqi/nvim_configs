--###################################################################
--			vim-sneak options
--###################################################################

vim.g['sneak#label'] = 1 --lables the matches for faster navigation
vim.g['sneak#use_ic_scs'] = 1
vim.g['sneak#prompt'] = '🔎'

-- Customize this for your favorite color for vim-sneak.
vim.cmd([[
  highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
  highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow
]])


--###################################################################
--			Quickscope options
--###################################################################

-- Trigger a highlight in the appropriate direction when pressing these keys:
vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

-- Customize this for your favorite color for Quickscope.
vim.cmd([[
  highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline
]])

vim.g.qs_max_chars = 150


