-- some general settings
vim.o.nu = true
vim.o.relativenumber = true
vim.o.syntax = 'enable'
vim.o.termguicolors = true
vim.o.mouse = 'a' -- Enable mouse support
vim.o.clipboard = 'unnamedplus'
vim.o.colorcolumn = '81'
vim.o.textwidth	= 80

-- To highlight current line and column
vim.o.cursorline = true
vim.o.cursorcolumn = true

-- TextEdit might fail if hidden is not set.
vim.o.hidden = true

-- Some servers have issues with backup files, see #649.
vim.o.backup = false
vim.o.writebackup = false

vim.o.wrap = false -- Display long lines as just one line
vim.o.encoding = "utf-8" -- The encoding displayed
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.ruler = true --Show the cursor position all the time
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
-- vim.cmd("set iskeyword+=-") -- treat dash separated words as a word text object"

vim.o.tabstop = 2 -- Insert 2 spaces for a tab
vim.o.softtabstop = 2
vim.o.shiftwidth = 2 -- Change the number of space characters inserted for indentation
vim.o.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
vim.o.expandtab = true -- Converts tabs to spaces
vim.o.smartindent = true -- Makes indenting smart
vim.o.autoindent = true -- Good auto indent



--###################################################################
--			Treesitter options for Folding
--###################################################################

-- From treesitter github page. these are related to other things like indentation
-- related to python and ... so I keep them here as a general setting.
vim.o.foldmethod = 'expr'
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 2

--[[ ===================================================================
			coc settings from the site
			!! i just copied from coc
				official site.
			(ported from vimscript)
=================================================================== ]]

if vim.g.wlsp == "coc" then
  -- Give more space for displaying messages.
  vim.g.cmdheight = 2
  --[[ Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  delays and poor user experience. ]]
  vim.g.updatetime = 300
  -- Don't pass messages to |ins-completion-menu|.
  vim.cmd("set shortmess+=c") -- lua equibalent: vim.opt.shortmess:append({c = true})
end

--[[ ====================================================================
    		Vimux Configs
==================================================================== ]]
vim.g.VimuxHeight = "20" -- hight of opening terminal
vim.g.VimuxOrientation = "v" -- split terminal in bellow pane


--[[ ####################################################################
  			nvim-gdb configs
#################################################################### ]]

-- vim.g.loaded_nvimgdb = 1 -- to disable plugin


--[[ ####################################################################
  			vimspector configs
#################################################################### ]]

--[[ Some Good Tutorials for this plugin are:
1. https://www.youtube.com/watch?v=U4KLYhkIgB4
2. https://www.youtube.com/watch?v=AnTX2mtOl9Q
3. https://www.youtube.com/watch?v=anYJg5GX2xI

In the future I will cerate a task for automatically creating
'.vimspector.json' files.

vimspector can have remote debugging!!! ]]

vim.g.vimspector_enable_mappings = "VISUAL_STUDIO" -- works with my keymaps

--[[ ####################################################################
  			sniprun configs
#################################################################### ]]
-- Some Configs from the sniprun repository:

-- I think for example python interpreter
-- vim.g.SnipRun_select_interpreters = { 'name_of_the_interpreter' }

--[[ ####################################################################
  		            	vim_bookmarks configs
#################################################################### ]]

vim.g.bookmark_save_per_working_dir = 1
vim.g.bookmark_auto_save = 1
vim.g.bookmark_no_default_key_mappings = 1

--[[ ####################################################################
  		            	vim_move configs
#################################################################### ]]
-- use Alt key with jklh keys to move things. Nice ha!
vim.g.move_key_modifier = "A"

--[[ ####################################################################
  		            	indent_blankline configs
#################################################################### ]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
  show_end_of_line = true,
  show_char_blankline = " ",
  show_current_context = true,
  buftype_exclude = {'terminal', 'nofile'},
  filetype_exclude = {'help', 'packer', 'dashboard'},
}

--[[ ####################################################################
  		            	nvim_notify configs
#################################################################### ]]

require("notify").setup({
  -- Animation style
  stages = "static",
  -- timeout for notifications
    timeout = 1000,
})
-- use nvim_notify as neovim notifier
vim.notify = require("notify")

--[[ ####################################################################
  		            	cmp-spell configs
#################################################################### ]]

vim.opt.spell = true
vim.opt.spelllang = {'en_us'}















