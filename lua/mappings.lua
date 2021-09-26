--[[###########################################################
--		              General keymaps
--###########################################################]]

vim.g.mapleader = '\\'
vim.api.nvim_set_keymap('i', 'ii', '<ESC>', {} )
vim.api.nvim_set_keymap('x', 'ii', '<ESC>', {} )
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
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fM', ':Telescope vim_bookmarks all<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<Space>t', [[<Cmd>lua require('telescope').extensions.asynctasks.all()<CR>]], {noremap = true})
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

vim.api.nvim_set_keymap('', '<leader><leader>s', '<Plug>Sneak_s', {})
vim.api.nvim_set_keymap('', '<leader><leader>S', '<Plug>Sneak_S', {})
vim.api.nvim_set_keymap('', '<leader><leader>f', '<Plug>Sneak_f', {})
vim.api.nvim_set_keymap('', '<leader><leader>F', '<Plug>Sneak_F', {})
vim.api.nvim_set_keymap('', '<leader><leader>t', '<Plug>Sneak_t', {})
vim.api.nvim_set_keymap('', '<leader><leader>T', '<Plug>Sneak_T', {})


--[[ ===================================================================
                    coc keymaps from the site
                    !! I just copied from coc
                    official site and modified
                    keys.
                    (ported from vimscript)
=================================================================== ]]

-- Use <c-space> to trigger completion.
vim.api.nvim_set_keymap('i', '<c-space>', 'coc#refresh()', {silent = true, expr = true, noremap = true})
-- Use `[g` and `]g` to navigate diagnostics
vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})
-- GoTo code navigation.
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {silent = true})
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
--[[ Mappings using CoCList:
Show all diagnostics. ]]
vim.api.nvim_set_keymap('n', '<Space>a', ':<C-u>CocList diagnostics<cr>', {silent = true, noremap = true, nowait = true})
-- Manage extensions.
vim.api.nvim_set_keymap('n', '<Space>e', ':<C-u>CocList extensions<cr>', {silent = true, noremap = true, nowait = true})
-- Show commands.
vim.api.nvim_set_keymap('n', '<Space>c', ':<C-u>CocList commands<cr>', {silent = true, noremap = true, nowait = true})
-- Find symbol of current document.
vim.api.nvim_set_keymap('n', '<Space>o', ':<C-u>CocList outline<cr>', {silent = true, noremap = true, nowait = true})
-- Search workspace symbols.
vim.api.nvim_set_keymap('n', '<Space>s', ':<C-u>CocList -I symbols<cr>', {silent = true, noremap = true, nowait = true})
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
vim.api.nvim_set_keymap('n', '<leader><F8>', ':TagbarToggle<CR>', {})


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

































