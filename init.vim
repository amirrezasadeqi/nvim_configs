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

" I found the bellow command from the following link:
" 'https://github.com/junegunn/fzf.vim/issues/251#issuecomment-769787221'
" using this we can have option to open/cd to a directory with fzf, so we can
" have a workflow like vscode that we run vscode from gui and open a directory
" as workspace and continue to work. I have created a mapping for it inside of
" telescope mappings section. Note:use ! sign to get from root directories
" otherwise uses the current working directory as base.

command! -bang -bar -nargs=? -complete=dir Cd
    \ call fzf#run(fzf#wrap(
    \ {'source': 'find '.( empty("<args>") ? ( <bang>0 ? "~" : "." ) : "<args>" ) .' -type d',
    \ 'sink': 'cd'}))

" source configurations from lua files
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


