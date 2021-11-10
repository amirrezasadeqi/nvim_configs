--[[###########################################################
--		              General keymaps
--###########################################################]]

vim.g.mapleader = '\\'
vim.api.nvim_set_keymap('i', 'ii', '<ESC>', {} )
vim.api.nvim_set_keymap('x', 'ii', '<ESC>', {} )
vim.api.nvim_set_keymap('n', '<Leader>ii', ':noh<CR>', {} )
vim.api.nvim_set_keymap('n', '<Leader>bd', ':bdelete!<CR>', {noremap = true, silent = true})



--[[###########################################################
--		              Nvim Tree keymaps
--###########################################################]]

vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeToggle<CR>', {silent = true})

--[[###########################################################
--		              Bufferline keymaps
--###########################################################]]

vim.api.nvim_set_keymap('n', '[b', ':BufferLineCycleNext<CR>', {noremap = true,silent = true})
vim.api.nvim_set_keymap('n', 'b]', ':BufferLineCyclePrev<CR>', {noremap = true,silent = true})

--[[###########################################################
--		              Telescope keymaps
--###########################################################]]

vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fo', ':Cd!<CR>', {silent = true, noremap = true}) -- open directory as workspace using fzf
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fM', ':Telescope vim_bookmarks all<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader><Space>t', [[<Cmd>lua require('telescope').extensions.asynctasks.all()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<C-p>', ":lua require'telescope'.extensions.project.project{}<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<leader>fs', ':Telescope session-lens search_session<CR>', {silent = true, noremap = true})


--[[###########################################################
--		              Dashboard keymaps
--###########################################################]]

--[[Note that becuase i setup dashboard to use telescope dashboard commands are
actually the telescope commands and actually they are a wrapper around them
i think!]]
vim.api.nvim_set_keymap('n', '<leader>ss', ':SessionSave<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>sl', ':SessionLoad<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>fH', ':DashboardFindHistory<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tc', ':DashboardChangeColorscheme<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fm', ':DashboardJumpMark<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cn', ':DashboardNewFile<CR>', {silent = true, noremap = true})


--[[###########################################################
--		              vim-sneak keymaps
--###########################################################]]

vim.api.nvim_set_keymap('', '<leader>sn', '<Plug>Sneak_s', {})
vim.api.nvim_set_keymap('', '<leader>Sn', '<Plug>Sneak_S', {})
vim.api.nvim_set_keymap('', '<leader>fn', '<Plug>Sneak_f', {})
vim.api.nvim_set_keymap('', '<leader>Fn', '<Plug>Sneak_F', {})
vim.api.nvim_set_keymap('', '<leader>tn', '<Plug>Sneak_t', {})
vim.api.nvim_set_keymap('', '<leader>Tn', '<Plug>Sneak_T', {})


--[[ ===================================================================
                    coc keymaps from the site
                    !! I just copied from coc
                    official site and modified
                    keys.
                    (ported from vimscript)
=================================================================== ]]

if vim.g.wlsp == "coc" then
  -- Use <c-space> to trigger completion.
  vim.api.nvim_set_keymap('i', '<c-space>', 'coc#refresh()', {silent = true, expr = true, noremap = true})
  -- Use `[g` and `]g` to navigate diagnostics
  vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
  vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})
  -- GoTo code navigation.
  -- vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {silent = true})
  vim.api.nvim_set_keymap('n', 'gd', ':Telescope coc definitions<CR>', {silent = true}) -- telescope version of previous line
  vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
  vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
  -- vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {silent = true})
  vim.api.nvim_set_keymap('n', 'gr', ':Telescope coc references<CR>', {silent = true}) -- telescope version of previous line
  -- Use K to show documentation in preview window.
  vim.api.nvim_set_keymap('n', 'K', ':call <SID>show_documentation()<CR>', {silent = true, noremap = true})
  -- Symbol renaming.
  vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', {})
  -- Formatting selected code.
  vim.api.nvim_set_keymap('x', '<leader>f', '<Plug>(coc-format-selected)', {})
  vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>(coc-format-selected)', {})
  --[[ Applying codeAction to the selected region.
  Example: `<leader>aap` for current paragraph ]]
  vim.api.nvim_set_keymap('x', '<leader>a', '<Plug>(coc-codeaction-selected)', {})
  vim.api.nvim_set_keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)', {})
  -- Remap keys for applying codeAction to the current line.
  vim.api.nvim_set_keymap('n', '<leader>ac', '<Plug>(coc-codeaction)', {})
  -- Apply AutoFix to problem on the current line.
  vim.api.nvim_set_keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', {})
  --[[ Map function and class text objects
  NOTE: Requires 'textDocument.documentSymbol' support from the language server. ]]
  vim.api.nvim_set_keymap('x', 'if', '<Plug>(coc-funcobj-i)', {})
  vim.api.nvim_set_keymap('o', 'if', '<Plug>(coc-funcobj-i)', {})
  vim.api.nvim_set_keymap('x', 'af', '<Plug>(coc-funcobj-a)', {})
  vim.api.nvim_set_keymap('o', 'af', '<Plug>(coc-funcobj-a)', {})
  vim.api.nvim_set_keymap('x', 'ic', '<Plug>(coc-classobj-i)', {})
  vim.api.nvim_set_keymap('o', 'ic', '<Plug>(coc-classobj-i)', {})
  vim.api.nvim_set_keymap('x', 'ac', '<Plug>(coc-classobj-a)', {})
  vim.api.nvim_set_keymap('o', 'ac', '<Plug>(coc-classobj-a)', {})
  --[[ Use CTRL-S for selections ranges.
  Requires 'textDocument/selectionRange' support of language server. ]]
  vim.api.nvim_set_keymap('n', '<C-s>', '<Plug>(coc-range-select)', {silent = true})
  vim.api.nvim_set_keymap('x', '<C-s>', '<Plug>(coc-range-select)', {silent = true})
  --[[ Mappings using CoCList and their telescope alternatives, use what you want:
  Show all diagnostics. ]]
  -- vim.api.nvim_set_keymap('n', '<Space>a', ':<C-u>CocList diagnostics<cr>', {silent = true, noremap = true, nowait = true})
  vim.api.nvim_set_keymap('n', '<Space>a', ':Telescope coc workspace_diagnostics<cr>', {silent = true, noremap = true, nowait = true})
  -- Manage extensions.
  vim.api.nvim_set_keymap('n', '<Space>e', ':<C-u>CocList extensions<cr>', {silent = true, noremap = true, nowait = true})
  -- Show commands.
  -- vim.api.nvim_set_keymap('n', '<Space>c', ':<C-u>CocList commands<cr>', {silent = true, noremap = true, nowait = true})
  vim.api.nvim_set_keymap('n', '<Space>c', ':Telescope coc commands<cr>', {silent = true, noremap = true, nowait = true})
  -- Find symbol of current document.
  vim.api.nvim_set_keymap('n', '<Space>o', ':<C-u>CocList outline<cr>', {silent = true, noremap = true, nowait = true})
  -- Search workspace symbols.
  -- vim.api.nvim_set_keymap('n', '<Space>s', ':<C-u>CocList -I symbols<cr>', {silent = true, noremap = true, nowait = true})
  vim.api.nvim_set_keymap('n', '<Space>s', ':Telescope coc workspace_symbols<cr>', {silent = true, noremap = true, nowait = true})
  -- Do default action for next item.
  vim.api.nvim_set_keymap('n', '<Space>j', ':<C-u>CocNext<cr>', {silent = true, noremap = true, nowait = true})
  -- Do default action for previous item.
  vim.api.nvim_set_keymap('n', '<Space>k', ':<C-u>CocPrev<cr>', {silent = true, noremap = true, nowait = true})
  -- Resume latest coc list.
  vim.api.nvim_set_keymap('n', '<Space>p', ':<C-u>CocListResume<cr>', {silent = true, noremap = true, nowait = true})
  -- List Tasks
  vim.api.nvim_set_keymap('n', '<Space>t', ':<C-u>CocList tasks<cr>', {silent = true, noremap = true})
  --[[ Restart Coc for reloading the compile_commands.json for after including new
  path: ]]
  vim.api.nvim_set_keymap('n', '<Space>re', ':<C-u>CocRestart<cr>', {silent = true, noremap = true})
end

--[[ ====================================================================
    		              neovim built-in lsp keybindings
==================================================================== ]]

if vim.g.wlsp == "nvim_lsp" then
  On_attach_lsp_keymaps = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
  end
end

--[[ ====================================================================
    		              Async task and runer keybindings
==================================================================== ]]

--[[ kill the async process in two ways. this is because AsyncTask have a bug
that says background job is still running.
using AsyncStop: I don't know how behaves when more than one process is
running but this situation is rare and most of the times I think it would
work well. ]]
vim.api.nvim_set_keymap('n', '<leader>kk', ':AsyncStop<cr>', {noremap = true})
--[[ using ! killall command. if previous way did not work use this one. it
prints an red flag that says the roscore-spawn job failed. so I like the
first way more. ]]
vim.api.nvim_set_keymap('n', '<leader>kt', ':!killall -9 roscore && killall -9 rosmaster<Cr>', {noremap = true})

--[[ ====================================================================
    		              Vimux keybindings
==================================================================== ]]
-- Some Bindings to Control Terminal
vim.api.nvim_set_keymap('n', '<Leader>tmr', ':VimuxPromptCommand<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>tml', ':VimuxRunLastCommand<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>tmc', ':VimuxCloseRunner<CR>', {noremap = true})

--[[ ####################################################################
  			              Tagbar keymaps
#################################################################### ]]
-- vim.api.nvim_set_keymap('n', '<leader>tag', ':TagbarToggle<CR>', {})


--[[ ####################################################################
  			              vimspector keymaps
#################################################################### ]]

-- <F5> start the debugger
-- stop debugger
vim.api.nvim_set_keymap('n', '<leader>dx', ':VimspectorReset<CR>', {})
-- evaluation of some variables
vim.api.nvim_set_keymap('n', '<leader>de', ':VimspectorEval<CR>', {})
-- watche window
vim.api.nvim_set_keymap('n', '<leader>dw', ':VimspectorWatch<CR>', {})
-- output window
vim.api.nvim_set_keymap('n', '<leader>do', ':VimspectorShowOutput<CR>', {})

--[[ bellow keybinds are from
https://github.com/awesome-streamers/awesome-streamerrc.git" ]]

--[[ vim.api.nvim_set_keymap('n', '<leader>dd', ':call vimspector#Launch()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>dc', ':call GotoWindow(g:vimspector_session_windows.code)<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>dt', ':call GotoWindow(g:vimspector_session_windows.tagpage)<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>dv', ':call GotoWindow(g:vimspector_session_windows.variables)<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>dw', ':call GotoWindow(g:vimspector_session_windows.watches)<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ds', ':call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>do', ':call GotoWindow(g:vimspector_session_windows.output)<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>de', ':call vimspector#Reset()<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>dtcb', ':call vimspector#CleanLineBreakpoint()<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>dl', '<Plug>VimspectorStepInto', {})
vim.api.nvim_set_keymap('n', '<leader>dj', '<Plug>VimspectorStepOver', {})
vim.api.nvim_set_keymap('n', '<leader>dk', '<Plug>VimspectorStepOut', {})
vim.api.nvim_set_keymap('n', '<leader>d_', '<Plug>VimspectorRestart', {})
vim.api.nvim_set_keymap('n', '<leader>d<space>', ':call vimspector#Continue()<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>drc', '<Plug>VimspectorRunToCursor', {})
vim.api.nvim_set_keymap('n', '<leader>dbp', '<Plug>VimspectorToggleBreakpoint', {})
vim.api.nvim_set_keymap('n', '<leader>dcbp', '<Plug>VimspectorToggleConditionalBreakpoint', {}) ]]

--[[ ####################################################################
  			              sniprun keymaps
#################################################################### ]]

vim.api.nvim_set_keymap('n', '<Leader><Leader>sl', ':SnipRun<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<Leader><Leader>sv', ':SnipRun<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>st', ':SnipTerminate<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>sr', ':SnipReset<CR>', {noremap = true})

--[[ ####################################################################
  		            	vim_bookmarks keymaps
#################################################################### ]]

vim.api.nvim_set_keymap('n', '<Leader>mm', '<Plug>BookmarkToggle', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>mi', '<Plug>BookmarkAnnotate', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ma', '<Plug>BookmarkShowAll', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>mn', '<Plug>BookmarkNext', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>mp', '<Plug>BookmarkPrev', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>mc', '<Plug>BookmarkClear', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>mx', '<Plug>BookmarkClearAll', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>mkk', '<Plug>BookmarkMoveUp', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>mjj', '<Plug>BookmarkMoveDown', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>mg', '<Plug>BookmarkMoveToLine', {silent = true})

--[[ ####################################################################
  		            	vim-vsnip keymaps
#################################################################### ]]

--[[ Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
See https://github.com/hrsh7th/vim-vsnip/pull/50 ]]
vim.api.nvim_set_keymap('n', '<Leader>vs', '<Plug>(vsnip-select-text)', {})
vim.api.nvim_set_keymap('x', '<Leader>vs', '<Plug>(vsnip-select-text)', {})
vim.api.nvim_set_keymap('n', '<Leader>vS', '<Plug>(vsnip-cut-text)', {})
vim.api.nvim_set_keymap('x', '<Leader>vS', '<Plug>(vsnip-cut-text)', {})

--[[###########################################################
--		              undotree keymaps
--###########################################################]]

vim.api.nvim_set_keymap('n', '<Leader>ut', ':UndotreeToggle<CR>', {noremap = true})

--[[###########################################################
--		              goto-preview keymaps
--###########################################################]]

if vim.g.wlsp == 'nvim_lsp' then
  vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
  vim.api.nvim_set_keymap("n", "<leader>gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", {noremap=true})
  vim.api.nvim_set_keymap("n", "<leader>gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})
end

--[[###########################################################
--		              vim-easy-align keymaps
--###########################################################]]

function Easy_align_keys()
  vim.api.nvim_set_keymap("n", "<leader>ga", '<Plug>(EasyAlign)', {})
  vim.api.nvim_set_keymap("x", "<leader>ga", '<Plug>(EasyAlign)', {})
end

--[[###########################################################
--		              nvim-biscuits keymaps
--###########################################################]]

Biscuits_toggle_keybind = '<leader>cb'

--[[###########################################################
--		              comment-frame keymaps
--###########################################################]]

function Comment_frame_keys()
  vim.api.nvim_set_keymap('n', '<leader>cf', ":lua require('nvim-comment-frame').add_comment()<CR>", {})
  vim.api.nvim_set_keymap('n', '<leader>cm', ":lua require('nvim-comment-frame').add_multiline_comment()<CR>", {})
end

--[[###########################################################
--		              vim-doge keymaps
--###########################################################]]

function Doge_keys()
  vim.g.doge_mapping = '<leader>dg'

  -- vim.g.doge_mapping_comment_jump_forward = '<leader><C-n>'
  -- vim.g.doge_mapping_comment_jump_backward = '<leader><C-p>'

  -- 'i' was deleted to prevent confliction of <TAB> keymap with nvim-cmp <TAB>
  -- mapping. Till now I could not find a way to check that TODO comment is
  -- available or not to prevent this confliction. in future ...
  vim.g.doge_comment_jump_modes = {'n', 's'}
end

--[[###########################################################
--		              trouble.nvim keymaps
--###########################################################]]

function Trouble_keys()
  vim.api.nvim_set_keymap("n", "<leader>tr", "<cmd>Trouble<cr>", {silent = true, noremap = true})
end

--[[###########################################################
--		              gutentas_plus keymaps
--###########################################################]]

function GutentagsPlus_keys()
  vim.api.nvim_set_keymap ('n', '<leader><leader>cs' ,':GscopeFind s <C-R><C-W><cr>', {silent = true, noremap = true})
  vim.api.nvim_set_keymap ('n', '<leader><leader>cg' ,':GscopeFind g <C-R><C-W><cr>', {silent = true, noremap = true})
  vim.api.nvim_set_keymap ('n', '<leader><leader>cc' ,':GscopeFind c <C-R><C-W><cr>', {silent = true, noremap = true})
  vim.api.nvim_set_keymap ('n', '<leader><leader>ct' ,':GscopeFind t <C-R><C-W><cr>', {silent = true, noremap = true})
  vim.api.nvim_set_keymap ('n', '<leader><leader>ce' ,':GscopeFind e <C-R><C-W><cr>', {silent = true, noremap = true})
  vim.api.nvim_set_keymap ('n', '<leader><leader>cf' ,':GscopeFind f <C-R>=expand("<cfile>")<cr><cr>', {silent = true, noremap = true})
  vim.api.nvim_set_keymap ('n', '<leader><leader>ci' ,':GscopeFind i <C-R>=expand("<cfile>")<cr><cr>', {silent = true, noremap = true})
  vim.api.nvim_set_keymap ('n', '<leader><leader>cd' ,':GscopeFind d <C-R><C-W><cr>', {silent = true, noremap = true})
  vim.api.nvim_set_keymap ('n', '<leader><leader>ca' ,':GscopeFind a <C-R><C-W><cr>', {silent = true, noremap = true})
  vim.api.nvim_set_keymap ('n', '<leader><leader>cz' ,':GscopeFind z <C-R><C-W><cr>', {silent = true, noremap = true})
end

--[[###########################################################
--		              cscope.vim keymaps
--###########################################################]]

function Cscove_keys()
  vim.api.nvim_set_keymap('n', '<leader><leader>sfi', ":call CscopeFindInteractive(expand('<cword>'))<CR>", {noremap = true})
  vim.api.nvim_set_keymap('n', '<leader><leader>sfl', ":call ToggleLocationList()<CR>", {noremap = true})
  vim.api.nvim_set_keymap('n', '<leader><leader>sfs', ":call CscopeFind('s', expand('<cword>'))<CR>", {noremap = true})
  vim.api.nvim_set_keymap('n', '<leader><leader>sfg', ":call CscopeFind('g', expand('<cword>'))<CR>", {noremap = true})
  vim.api.nvim_set_keymap('n', '<leader><leader>sfd', ":call CscopeFind('d', expand('<cword>'))<CR>", {noremap = true})
  vim.api.nvim_set_keymap('n', '<leader><leader>sfc', ":call CscopeFind('c', expand('<cword>'))<CR>", {noremap = true})
  vim.api.nvim_set_keymap('n', '<leader><leader>sft', ":call CscopeFind('t', expand('<cword>'))<CR>", {noremap = true})
  vim.api.nvim_set_keymap('n', '<leader><leader>sfe', ":call CscopeFind('e', expand('<cword>'))<CR>", {noremap = true})
  vim.api.nvim_set_keymap('n', '<leader><leader>sff', ":call CscopeFind('f', expand('<cword>'))<CR>", {noremap = true})
  vim.api.nvim_set_keymap('n', '<leader><leader>sfI', ":call CscopeFind('i', expand('<cword>'))<CR>", {noremap = true})
end

--[[###########################################################
--		              builtin cscope keymaps
--###########################################################]]

-- cscope.vim and gutentags work well use these in necessary momments otherwise
-- use them, specially the gutentags would be my daily driver. enjoy it.
vim.api.nvim_set_keymap('n', '<leader>sfs', [[:call setqflist([], 'r') | copen | cs find s <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>sfg', [[:call setqflist([], 'r') | copen | cs find g <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>sfc', [[:call setqflist([], 'r') | copen | cs find c <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>sft', [[:call setqflist([], 'r') | copen | cs find t <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>sfe', [[:call setqflist([], 'r') | copen | cs find e <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>sff', [[:call setqflist([], 'r') | copen | cs find f <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>sfi', [[:call setqflist([], 'r') | copen | cs find i ^<C-R>=expand("<cfile>")<CR>$<CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>sfd', [[:call setqflist([], 'r') | copen | cs find d <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})

vim.api.nvim_set_keymap('n', '<leader>ssfs', [[:call setqflist([], 'r') | copen | scs find s <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>ssfg', [[:call setqflist([], 'r') | copen | scs find g <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>ssfc', [[:call setqflist([], 'r') | copen | scs find c <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>ssft', [[:call setqflist([], 'r') | copen | scs find t <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>ssfe', [[:call setqflist([], 'r') | copen | scs find e <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>ssff', [[:call setqflist([], 'r') | copen | scs find f <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>ssfi', [[:call setqflist([], 'r') | copen | scs find i ^<C-R>=expand("<cfile>")<CR>$<CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>ssfd', [[:call setqflist([], 'r') | copen | scs find d <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})

vim.api.nvim_set_keymap('n', '<leader>svfs', [[:copen | wincmd p | call setqflist([], 'r') | vert scs find s <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>svfg', [[:copen | wincmd p | call setqflist([], 'r') | vert scs find g <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>svfc', [[:copen | wincmd p | call setqflist([], 'r') | vert scs find c <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>svft', [[:copen | wincmd p | call setqflist([], 'r') | vert scs find t <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>svfe', [[:copen | wincmd p | call setqflist([], 'r') | vert scs find e <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>svff', [[:copen | wincmd p | call setqflist([], 'r') | vert scs find f <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>svfi', [[:copen | wincmd p | call setqflist([], 'r') | vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR><C-W><C-W>]], {})
vim.api.nvim_set_keymap('n', '<leader>svfd', [[:copen | wincmd p | call setqflist([], 'r') | vert scs find d <C-R>=expand("<cword>")<CR><CR><C-W><C-W>]], {})

----------------------------------------------------------------------
--                         harpoon keymaps                          --
----------------------------------------------------------------------

function Harpoon_keys()
  vim.api.nvim_set_keymap('n', '<leader>hat', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {})
  vim.api.nvim_set_keymap('n', '<leader>haa', ":lua require('harpoon.mark').add_file()<CR>", {})
end









