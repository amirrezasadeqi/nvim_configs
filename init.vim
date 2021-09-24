" ==================================================================
"
"                        init.vim. The Newer Version From 
"                                Scratch.
"
"                        Amir Reza Sadeghi
"                        Email:: www.e.a.sadeqi@gmail.com
"
"===================================================================

" I have ported most of my settings to lua. Note that some settings like 'au'
" and highlighting have not proper lua interface yet, so I use init.vim for
" them.
lua require('init')

" source vimscript files for configuration of specific plugins
source ~/.config/nvim/vim_scripts/coc_configs.vim 
source ~/.config/nvim/vim_scripts/tagbar_configs.vim

"====================================================================
" Here is the configs from the plugins that I used before porting of con-
" figs to lua and now I use other plugins instead of them. So I just hold
" them here for completness and emeregency situations.
"====================================================================

"====================================================================
"                         airline theme config
"====================================================================
" let g:airline_theme='dracula'
" let g:airline#extensions#tabline#enabled = 1
"====================================================================
"    		                  NerdTree configs
"====================================================================
"some mappings
" nnoremap <leader>n : NERDTreeToggle<CR>
" let g:NERDTreeMinimalUI = 1  " Hide help text
""====================================================================
"    		                  fzf configs
"====================================================================
" Bellow Lines are for fzf.vim plugin
" let g:fzf_command_prefix = 'Fz'
" nnoremap <C-p> : FzFiles<Cr>
" nnoremap <leader>fb :FzBuffers<CR>
" nnoremap <leader>fw :FzWindows<CR>
" nnoremap <leader>flt :FzBTags<CR>
" nnoremap <leader>ft :FzTags<CR>
" nnoremap <leader>fh :FzHistory<CR>

" coc-fzf-preview settings

"####################################################################
"  			                    cxx-highlight
"####################################################################
"let g:lsp_cxx_hl_use_text_props = 1


"###################################################################
" 			                    The End
"###################################################################


