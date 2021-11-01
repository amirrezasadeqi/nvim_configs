-- Boot strapping: ensures installation of packer plugin manager on any new system
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function(use)

  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}

  -- to make a colorscheme default, comment config option of previous default one
  -- and add config option to the new one with require('<colorscheme>').setup()
  -- in it.
  use {'Mofiqul/dracula.nvim', as = 'dracula'}
  use {'tiagovla/tokyodark.nvim'}
  use {'bluz71/vim-moonfly-colors'}
  use {'EdenEast/nightfox.nvim'} -- require('nightfox').load(<fox_name>)
  use {'rmehri01/onenord.nvim'}
  use {'shaunsingh/nord.nvim'}
  use{
    'rose-pine/neovim',
    as = 'rose-pine',
    --[[ config = function()
      vim.g.rose_pine_variant = 'base'
      vim.cmd('colorscheme rose-pine')
    end ]]
  }
  use {
    'marko-cerovac/material.nvim',
    --[[ config = function ()
      vim.g.material_style = 'deep ocean'
      require('material').setup()
    end ]]
  }
  use {'navarasu/onedark.nvim',
    config = function()
      vim.g.onedark_style = 'deep'
      vim.g.onedark_toggle_style_keymap = '<nop>'
      require('onedark').setup()
    end
  }

  if vim.g.wlsp == "coc" then
    use {'neoclide/coc.nvim', branch = 'release'}
  end

  use {'antoinemadec/FixCursorHold.nvim', config = [[vim.g.cursorhold_updatetime = 100]] } -- Fix CursorHold Performance for vim/neovim

  -- The expectation is that a form of this plugin will eventually be merged into
  -- Neovim core via a PR. This plugin serves as a way for impatient users to
  -- speed up there Neovim 0.5 until the PR is merged and included in a following
  -- Neovim release at which point this plugin will be redundant.
  use {'lewis6991/impatient.nvim'} -- Improve startup time for neovim

  use { -- spell checker that uses treesitter, so just checks the comments not code.
    'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup()
    end,
    disable = true
  }

  use {'jackguo380/vim-lsp-cxx-highlight', disable = true} -- using treesitter highlight instead
  use {'vim-airline/vim-airline', disable = true} -- using lualine instead which is in lua
  use {'vim-airline/vim-airline-themes', disable = true}

  use {
    'hoob3rt/lualine.nvim',
    event = 'VimEnter',
    config = [[require('lualine_configs')]],
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {'akinsho/bufferline.nvim', event = 'VimEnter', config = [[require('bufferline_configs')]], requires = 'kyazdani42/nvim-web-devicons'}
  use {'rcarriga/nvim-notify'} -- nice notification plugin
  use {'lukas-reineke/indent-blankline.nvim'} -- adding indentation guide lines, space dots and CRs

  use {'ryanoasis/vim-devicons', disable = true} -- using nvim-web-devicons instead which is in lua
  use {'preservim/nerdtree', disable = true} -- using neovim-tree instead which is in lua

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {'mbbill/undotree', cmd = {'UndotreeToggle'}, config = [[require('undotree_configs')]]} -- The undo history visualizer
  use {'tversteeg/registers.nvim', keys = {{'n', '"'}, {'i', '<c-R>'}}} -- preview and apply registers

  use {'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' }}
  use { -- anothre git plugin with many features which i need UI only.
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {'TimUntersberger/neogit',
    cmd = 'Neogit',
    config = [[require('neogit_configs')]],
    requires = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'}
  }
  use {'benmills/vimux', keys = {{'n', '<Leader>tmr'}, {'n', '<Leader>tml'}, {'n', '<Leader>tmc'}}} -- Vim + Tmux = Love

  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end, disable = true}
  --[[a wrapper for more fzf functionality like what coc plugins like coc-tasks
  does. coc-fzf-preview is the alternative but at the momment is not mature. fzf
  vim works like a charm and linux kernel is a breez for it.]]
  use {'junegunn/fzf.vim', disable = true}

  use {'preservim/tagbar', cmd = {'TagbarToggle'}, config = [[vim.cmd('source ~/.config/nvim/vim_scripts/tagbar_configs.vim')]]}
  use {'joe-skb7/cscope-maps'}
  use {'skywind3000/asynctasks.vim'}
  use {'skywind3000/asyncrun.vim'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-repeat'} --[[nice for extending '.' keymap for work with
		keymaps of plugins. for example repeats surround
		keymaps for nested paranthese. ]]
  -- Move faster in your text. it is minimaller than easymotion so I use this.
  use {'justinmk/vim-sneak', setup = [[require('sneak_configs')]], event = 'VimEnter'}
  use {'unblevable/quick-scope', setup = [[require('quickScope_configs')]], keys = {'f', 'F', 't', 'T'}} --better for horizontal
  use {'matze/vim-move'} -- Nice! move line visulas chars in four direction
  use {'wellle/targets.vim'} -- Vim plugin that provides additional text objects
  use {'andymass/vim-matchup', setup = [[require('matchup_configs')]], event = 'VimEnter', disable = true} -- a little extends vim's %
  use {'b3nj5m1n/kommentary', keys = {{'n', 'gcc'}, {'n', 'gc'}, {'v', 'gc'}}} --nice plugin for commenting

  use {'szw/vim-maximizer'} --[[maximize a window with <F3>
    it has some <C-o> which has
    some strange behavior but the
    <F3> only works well. ]]

-- Plugin for ROS snippets
-- the first plugin is more complete.
  use {'SweiLz/ROS-Snippets'}
  use {'pijaro/ros-snippets', disable = true}
  use {'rafamadriz/friendly-snippets'} -- snippets recommended by vim-vsnip also compatible with coc
  use {'honza/vim-snippets', disable = true} -- using freindly snippets instead

--[[Debugger Plugin
UpdateRemotePlugins before the first time using sakhnik/nvim-gdb plugin is
necessary. ]]

use {'sakhnik/nvim-gdb', run = ':!./install.sh', disable = true}

--[[Actually I will use vimspector plugin. a greate plugin for debugging
 different languages with ease. the sakhnik/nvim-gdb is good for gdb and pdb
 but is baremetal and use it when necessary and you know how to use them and
 the plugin. there is a builtin debugger 'termdebug' for gdb. you must load
 it with packadd and run it by ':Termdebug <program-name>'.
 Note> 1. you can use DDD but make some task for running it from inside of
 	vim.
 	2. compile with '-g' option for using the debuggers.
 	3. you must install the middleware(in my thoughts is middleware!) or
 	gadet with VimspectorInstall command. i use debugpy and
 	vscode-cpptools at the momment. these gadets communicate between real
 	debugger and the plugin.
 	4. In the root workspace you must have a '.vimspector.json' file for
 	that project. ]]
  use {'puremourning/vimspector', keys = {{'n', '<F5>'}, {'n', '<F9>'}}}

--[[ A plugin for partially running codes like we do for python in vscode and
 jupyter notebooks:
 Nice feature. enjoy it!!!
 Note from the repository of sniprun:
 the klepto package: 'pip install --user klepto' if they use python with REPL.
 (Python REPL behaviour is enabled by default, but klepto has to be manually installed) ]]
  use {'michaelb/sniprun', keys = {{'n', '<Leader><Leader>sl'}, {'v', '<Leader><Leader>sv'}, {'n', '<Leader><Leader>st'}, {'n', '<Leader><Leader>sr'}}, run = 'bash install.sh'}

  -- Color previews for CSS
  use {'ap/vim-css-color', event = 'BufEnter'}

--[[lua written alternative for color preview
note that you must uncomment the setup function
of this plugin after the plugins setup. ]]
  use {'norcalli/nvim-colorizer.lua', disable = true}

  -- Treesitter to convert neovim to a full IDE in future!
  use {'nvim-treesitter/nvim-treesitter',
    event = 'VimEnter',
    requires = {
      -- adds text objects like function, class from treesitter
      {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'},
      -- adds highlighting of under-cursor symbol and its usages and S-rename and some more
      {'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter-textobjects'},
      -- used for developing tools with treesitter
      {'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle'},
      {'SmiteshP/nvim-gps', after = 'nvim-treesitter'},
      -- colorizing the nested braces
      {'p00f/nvim-ts-rainbow', after = 'nvim-treesitter'}
    },
    config = [[require('treesitter_configs')]],
    run = ':TSUpdate' -- We recommend updating the parsers on update
  }

-- Telescope and its extensions
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope-media-files.nvim',
    requires = { {'nvim-lua/popup.nvim'} }
  }
  use 'nvim-telescope/telescope-symbols.nvim' -- use to insert emojis greeks and so on
  use 'bi0ha2ard/telescope-ros.nvim' -- search through ros package and edit them(colcon required).

  use {
      "AckslD/nvim-neoclip.lua",
      config = function()
          require('neoclip').setup()
      end,
  }
  use 'GustavoKatel/telescope-asynctasks.nvim'
  if vim.g.wlsp == "coc" then
    use 'fannheyward/telescope-coc.nvim'
  end
  use 'nvim-telescope/telescope-project.nvim'
  use {
      'tom-anders/telescope-vim-bookmarks.nvim',
      requires = {'MattesGroeger/vim-bookmarks'}
  }

  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"tami5/sqlite.lua"},
    disable = true
  }

  use {'ThePrimeagen/refactoring.nvim', disable = true} --This is not complete yet and i will use it in future.

  if vim.g.wlsp == "nvim_lsp" then
    use {'neovim/nvim-lspconfig', after = 'cmp-nvim-lsp', config = [[require('nvimlsp_configs')]]} -- collection of configurations for built-in LSP client
    use {'williamboman/nvim-lsp-installer'} -- a package manager for language servers
    use {'hrsh7th/nvim-cmp', event = 'InsertEnter *', config = [[require('nvimcmp_configs')]]} -- Autocompletion plugin
    use {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'} -- lsp source for nvim-cmp
    use {'folke/lua-dev.nvim'}  -- provides docs for neovim lua api in autocompletion
    use {'hrsh7th/vim-vsnip', event = 'InsertEnter'} -- nice snippet engine that supports vscode snippets also
    use {'hrsh7th/vim-vsnip-integ', after = 'vim-vsnip'} -- vsnip integration with autocompletion engines
    use {'hrsh7th/cmp-vsnip', after = 'nvim-cmp'} -- vsnip source for nvim-cmp
    use {'hrsh7th/cmp-buffer', after = 'nvim-cmp'} -- buffer source for cmp
    use {'hrsh7th/cmp-cmdline', after = 'nvim-cmp'} -- command source for cmp
    use {'hrsh7th/cmp-path', after = 'nvim-cmp'} -- system path source for nvim-cmp
    use {'windwp/nvim-autopairs', after = 'nvim-cmp', config = [[require('autopairs_configs')]]} -- autopairing braces
    use {'onsails/lspkind-nvim'} -- nice icons in nvim-cmp
    use {'hrsh7th/cmp-calc', after = 'nvim-cmp'} -- replace answer of math calc
    use {'kdheepak/cmp-latex-symbols', after = 'nvim-cmp', disable = true} -- insertion of latex symbols
    use {'ray-x/cmp-treesitter', after = 'nvim-cmp', disable = true} -- cmp source for treesitter
    use {'f3fora/cmp-spell', after = 'nvim-cmp', disable = true} -- spell source for nvim-cmp
    use {'tzachar/cmp-tabnine', -- tabnine source for nvim-cmp
      run='./install.sh',
      config = function ()
        require('cmp_tabnine.config'):setup({
          max_lines = 1000,
          max_num_results = 20,
          sort = true,
          run_on_every_keystroke = true,
          snippet_placeholder = '..',
        })
      end,
      after = 'nvim-cmp',
      disable = true
    }
    use {
      'rmagatti/goto-preview',
      config = function()
        require('goto-preview').setup {}
      end,
    }
    use {
      "ray-x/lsp_signature.nvim",
      config = function ()
        require('lsp_signature').setup()
      end
    }
    use {
      'glepnir/lspsaga.nvim',
      config = function ()
        require('lspsaga').init_lsp_saga()
      end,
      cmd = {'Lspsaga'},
      disable = true
    }
  end

-- cover page for neovim
  use {'glepnir/dashboard-nvim'} --this is fancier than startify
  use {'mhinz/vim-startify', disable = true}

  -- Profiling
  use {'dstein64/vim-startuptime', cmd = 'StartupTime', config = [[vim.g.startuptime_tries = 100]]}

  --[[ config = {
    -- Move to lua dir so impatient.nvim can cache it
    -- Create a symbolic-link of plugin/packer_compiled.lua file in lua
    -- directory by running bellow command in the lua directory, so the lua
    -- require command in init.vim file can find this file and impatient can
    -- cache it(as I understood! and I don't know why compile_path option of
    -- packer does not work and create the compiled file in lua directory and
    -- this symbolic-link is my solution!):
    -- in lua directory run: "ln -s ../plugin/packer_compiled.lua"
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  } ]]

end)








