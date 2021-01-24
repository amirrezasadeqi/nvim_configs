" ==================================================================
"
"                        init.vim. The Newer Version From 
"                                Scratch.
"
"                        Amir Reza Sadeghi
"                        Email:: www.e.a.sadeqi@gmail.com
"
"===================================================================

"some general settings
set nu
set relativenumber
syntax on
set termguicolors
set mouse=a "enable mouse support
set clipboard=unnamedplus

set colorcolumn=81

"some key bindings to make life easier
:imap ii <Esc>
:nmap ; :
:nnoremap <leader>bd : bdelete<Cr>
:nnoremap <C-n> : bnext<Cr>

"===================================================================
"			setting up the plugins
"===================================================================
"here we will use vim plug, plugin manager it is faster.
call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'benmills/vimux' "Vim + Tmux = Love
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " a wrapper for more fzf functionality like what coc
			" plugins like coc-tasks does. coc-fzf-preview is the
			" alternative but at the momment is not mature.
			" fzf.vim works like a charm and linux kernel is a
			" breez for it.
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/tagbar'
Plug 'joe-skb7/cscope-maps'
Plug 'honza/vim-snippets'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' " nice for extending '.' keymap for work with 
			" keymaps of plugins. for example repeats surround
			" keymaps for nested paranthese.

Plug 'szw/vim-maximizer'  " maximize a window with <F3>
			  " it has some <C-o> which has 
			  " some strange behavior but the
			  " <F3> only works well.

" Plugin for ROS snippets
" the first plugin is more complete.
Plug 'SweiLz/ROS-Snippets'
"Plug 'pijaro/ros-snippets'

" Debugger Plugin
" UpdateRemotePlugins before the first time using sakhnik/nvim-gdb plugin is 
" necessary.
" Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

" Actually I will use vimspector plugin. a greate plugin for debugging
" different languages with ease. the sakhnik/nvim-gdb is good for gdb and pdb
" but is baremetal and use it when necessary and you know how to use them and
" the plugin. there is a builtin debugger 'termdebug' for gdb. you must load
" it with packadd and run it by ':Termdebug <program-name>'.
" Note> 1. you can use DDD but make some task for running it from inside of
" 	vim.
" 	2. compile with '-g' option for using the debuggers.
" 	3. you must install the middleware(in my thoughts is middleware!) or
" 	gadet with VimspectorInstall command. i use debugpy and
" 	vscode-cpptools at the momment. these gadets communicate between real
" 	debugger and the plugin.
" 	4. In the root workspace you must have a '.vimspector.json' file for
" 	that project.
Plug 'puremourning/vimspector'

" A plugin for partially running codes like we do for python in vscode and
" jupyter notebooks:
" Nice feature. enjoy it!!!
" Note from the repository of sniprun:
" the klepto package: 'pip install --user klepto' if they use python with REPL.
" (Python REPL behaviour is enabled by default, but klepto has to be manually installed)
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}

" Color previews for CSS
Plug 'ap/vim-css-color'

call plug#end()


"###################################################################
"			Colorscheme Dracula Setup
"###################################################################
colorscheme dracula

"===================================================================
"			coc settings from the site
"			!! i just copied from coc
"				official site.
"===================================================================
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" File type detection for roslaunch files
" I love this thing(line):
au BufRead,BufNewFile *.launch set filetype=xml
au BufRead,BufNewFile *.urdf set filetype=xml
au BufRead,BufNewFile *.xacro set filetype=xml

" adding some settings for python dev
au BufRead,BufNewFile python
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
    \ set foldmethod=indent
    \ set foldlevel=99

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" List Tasks
nnoremap <silent> <space>t  :<C-u>CocList tasks<CR>
" Restart Coc for reloading the compile_commands.json for after including new
" path:
nnoremap <silent> <space>re :<C-u>CocRestart<CR>
" kill the async process in two ways. this is because AsyncTask have a bug
" that says background job is still running.
" using AsyncStop: I don't know how behaves when more than one process is
" running but this situation is rare and most of the times I think it would
" work well.
nnoremap <leader>kk : AsyncStop <Cr>
" using ! killall command. if previous way did not work use this one. it
" prints an red flag that says the roscore-spawn job failed. so I like the
" first way more.
nnoremap <leader>kt : !killall -9 roscore && killall -9 rosmaster <Cr>

"====================================================================
"                    airline theme config
"====================================================================
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1
"====================================================================
"    		NerdTree configs
"====================================================================
"some mappings
nnoremap <leader>n : NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1  " Hide help text
""====================================================================
"    		fzf configs
"====================================================================
" Bellow Lines are for fzf.vim plugin
let g:fzf_command_prefix = 'Fz'
nnoremap <C-p> : FzFiles<Cr>
nnoremap <leader>fb :FzBuffers<CR>
nnoremap <leader>fw :FzWindows<CR>
nnoremap <leader>flt :FzBTags<CR>
nnoremap <leader>ft :FzTags<CR>
nnoremap <leader>fh :FzHistory<CR>

" coc-fzf-preview settings

"====================================================================
"    		Vimux Configs	
"====================================================================
let g:VimuxHeight = "20"
let g:VimuxOrientation = "v"
" some bindings
:nnoremap <leader>tr : VimuxPromptCommand<Cr>
:nnoremap <leader>tl : VimuxRunLastCommand<Cr>
:nnoremap <leader>tc : VimuxCloseRunner<Cr>
"####################################################################
"  			cxx-highlight
"####################################################################
let g:lsp_cxx_hl_use_text_props = 1

"####################################################################
"  			Tagbar configs
"####################################################################
nmap <leader><F8> :TagbarToggle<CR>
" add a definition for Objective-C to tagbar this is from the wiki page
" of the tagbar plugin.
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }

"####################################################################
"  			asynctasks configs
"####################################################################

" And quickfix window can be opened automatically, otherwise you can't
" see the task output unless using :copen manually.

let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg', '.vim', 'compile_commands.json', '.catkin_workspace']
" let g:asynctasks_term_pos = 'bottom'
" let g:asynctasks_term_rows = 10
" let g:asynctasks_term_cols = 80
" let g:asynctasks_profile = 'release'

"####################################################################
"  			nvim-gdb configs
"####################################################################

" let g:loaded_nvimgdb = 1 " to disable plugin


"####################################################################
"  			vimspector configs
"####################################################################

" Some Good Tutorials for this plugin are:
" 1. https://www.youtube.com/watch?v=U4KLYhkIgB4
" 2. https://www.youtube.com/watch?v=AnTX2mtOl9Q
" 3. https://www.youtube.com/watch?v=anYJg5GX2xI

" In the future I will cerate a task for automatically creating
" '.vimspector.json' files.

" vimspector can have remote debugging!!!

let g:vimspector_enable_mappings = 'VISUAL_STUDIO' " works with my keymaps
" <F5> start the debugger
" stop debugger
nmap <leader>dx : VimspectorReset<CR>
" evaluation of some variables
nmap <leader>de : VimspectorEval
" watche window
nmap <leader>dw : VimspectorWatch
" output window
nmap <leader>do : VimspectorShowOutput


" bellow keybinds are from
" https://github.com/awesome-streamers/awesome-streamerrc.git"

" nnoremap <leader>dd :call vimspector#Launch()<CR>
" nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
" nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
" nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
" nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
" nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
" nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
" nnoremap <leader>de :call vimspector#Reset()<CR>

" nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

" nmap <leader>dl <Plug>VimspectorStepInto
" nmap <leader>dj <Plug>VimspectorStepOver
" nmap <leader>dk <Plug>VimspectorStepOut
" nmap <leader>d_ <Plug>VimspectorRestart
" nnoremap <leader>d<space> :call vimspector#Continue()<CR>

" nmap <leader>drc <Plug>VimspectorRunToCursor
" nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
" nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint


"####################################################################
"  			sniprun configs
"####################################################################

" some Configs from the sniprun repository:

" let g:SnipRun_select_interpreters = ['name_of_the_interpreter'] " I think
								  " for
								  " example
								  " python
								  " interpreter.
nnoremap <leader>sl :SnipRun<CR>
vnoremap <leader>sv :SnipRun<CR>
nnoremap <leader>st :SnipTerminate<CR>
nnoremap <leader>sr :SnipReset<CR>





"###################################################################
" 			The End
"###################################################################


