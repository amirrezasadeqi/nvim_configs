--[[###########################################################
--		              vim-sneak setups
--###########################################################]]

vim.g['sneak#label'] = 1
vim.g['sneak#s_next'] = 1
vim.g['sneak#use_ic_scs'] = 1
vim.g['sneak#prompt'] = "🔎"

vim.cmd([[
" Change the colors
highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow
]])



