-- Boot strapping: ensures installation of packer plugin manager on any new system
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  --use {'dracula/vim', as = 'dracula' } -- using Mofiqul instead which is in lua
  use {'Mofiqul/dracula.nvim', as = 'dracula'}
  use {'joshdick/onedark.vim', as = 'onedark'}
  use {'neoclide/coc.nvim', branch = 'release'}

  -- use 'jackguo380/vim-lsp-cxx-highlight' -- using treesitter highlight instead
  -- use 'vim-airline/vim-airline' -- using lualine instead which is in lua
  -- use 'vim-airline/vim-airline-themes'
  use {
  'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- use 'ryanoasis/vim-devicons' -- using nvim-web-devicons instead which is in lua
  -- use 'preservim/nerdtree' -- using neovim-tree instead which is in lua
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use 'tpope/vim-fugitive'
  use { 		-- anothre git plugin with many features which i need UI only.
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use 'benmills/vimux' -- Vim + Tmux = Love
  --use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  --[[use 'junegunn/fzf.vim' --[[a wrapper for more fzf functionality like what coc
			 plugins like coc-tasks does. coc-fzf-preview is the
			 alternative but at the momment is not mature.
			 fzf.vim works like a charm and linux kernel is a
			 breez for it. ]]
  use 'preservim/tagbar'
  use 'joe-skb7/cscope-maps'
  use 'honza/vim-snippets'
  use 'skywind3000/asynctasks.vim'
  use 'skywind3000/asyncrun.vim'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat' --[[nice for extending '.' keymap for work with 
			 keymaps of plugins. for example repeats surround
			 keymaps for nested paranthese. ]]
--Move faster in your text. it is minimaller than easymotion so I use this.
  use 'justinmk/vim-sneak'
  use 'unblevable/quick-scope' --better for horizontal
  use 'b3nj5m1n/kommentary' --nice plugin for commenting

  use 'szw/vim-maximizer' --[[maximize a window with <F3>
			  it has some <C-o> which has 
			  some strange behavior but the
			  <F3> only works well. ]]

-- Plugin for ROS snippets
-- the first plugin is more complete.
  use 'SweiLz/ROS-Snippets'
--use 'pijaro/ros-snippets'

--[[Debugger Plugin
UpdateRemotePlugins before the first time using sakhnik/nvim-gdb plugin is 
necessary. ]]

--use 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

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
  use 'puremourning/vimspector'

--[[ A plugin for partially running codes like we do for python in vscode and
 jupyter notebooks:
 Nice feature. enjoy it!!!
 Note from the repository of sniprun:
 the klepto package: 'pip install --user klepto' if they use python with REPL.
 (Python REPL behaviour is enabled by default, but klepto has to be manually installed) ]]
  use {'michaelb/sniprun', run = 'bash install.sh'}

-- Color previews for CSS
use 'ap/vim-css-color'

--[[lua written alternative for color preview
note that you must uncomment the setup function 
of this plugin after the plugins setup. ]]
-- use 'norcalli/nvim-colorizer.lua'

-- Treesitter to convert neovim to a full IDE in future!
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  -- We recommend updating the parsers on update
  use 'nvim-treesitter/playground'  -- used for developing tools with treesitter
  use {'SmiteshP/nvim-gps'}

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
  use 'fannheyward/telescope-coc.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  use {
      'tom-anders/telescope-vim-bookmarks.nvim',
      requires = {'MattesGroeger/vim-bookmarks'}
  }

  --use 'ThePrimeagen/refactoring.nvim' --This is not complete yet and i will use it in future.
  --use 'neovim/nvim-lspconfig' --Collection of configurations for built-in LSP client
  				--in future i will setup it in a seperated branch.

-- cover page for neovim 
  use 'glepnir/dashboard-nvim' --this is fancier than startify
  --use 'mhinz/vim-startify'


end)

















