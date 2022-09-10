local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)

  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "antoinemadec/FixCursorHold.nvim" } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use { 'lewis6991/impatient.nvim' }
  use { 'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'warmer',
        toggle_style_key = '<nop>'
      }
      require('onedark').load()
    end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require("mnvim.nvimtree").config()
    end,
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("mnvim.whichkey").config()
    end
  }
  use {
    "rcarriga/nvim-notify",
    config = function()
      require("mnvim.notify").config()
    end
  }
  use {
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    -- A little wierd that this only works with function keyword
    -- but other plugins are ok with just requiring the desired function!
    config = function()
      require("mnvim.bufferline").config()
    end,
    event = "BufWinEnter"
  }
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("mnvim.lualine").config()
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    config = function()
      require("mnvim.telescope").config()
    end,
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    }
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    events = { "BufRead", "BufWinEnter", "BufNewFile" },
    config = function()
      require("mnvim.treesitter").config()
    end,
    run = ":TSUpdate" -- We recommend updating the parsers on update
  }
  use {
    'p00f/nvim-ts-rainbow',
    after = 'nvim-treesitter'
  }
  use {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle'
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent-blankline").setup {
        show_end_of_line = true,
        show_char_blankline = " ",
        show_current_context = true,
        buftype_exclude = { 'terminal', 'nofile' },
        filetype_exclude = { 'help', 'packer', 'dashboard' },
      }
    end,
    opt = true
  }
  use {
    'kevinhwang91/nvim-bqf',
    ft = 'qf'
  }
  use {
    'junegunn/fzf',
    run = function()
      vim.fn['fzf#install']()
    end,
    after = 'nvim-bqf'
  }
  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({
        auto_close = true
      })
    end,
    cmd = { 'Trouble' },
    keys = { '<leader>tr' }
  }
  use {
    'mbbill/undotree',
    config = function()
      require('mnvim.undotree').config()
    end,
    cmd = { 'UndotreeToggle' }
  }
  use {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' },
  }
  use {
    'lewis6991/gitsigns.nvim',
  }
  use {
    'TimUntersberger/neogit',
    cmd = { 'Neogit' },
    config = function()
      require('neogit').setup {
        integrations = {
          diffview = true,
        },
      }
    end,
    requires = {
      'sindrets/diffview.nvim',
    }
  }
  use {
    'mhartington/formatter.nvim',
    config = function()
      require("mnvim.formatter").config()
    end
  }
  use {
    'benmills/vimux', -- Vim + Tmux = Love
    -- 'preservim/vimux' -- if benmills repo didn't work you would use this instead.
    cmd = { "VimuxPromptCommand", "VimuxRunLastCommand", "VimuxCloseRunner" },
  }
  use {
    'ludovicchabant/vim-gutentags',
    requires = {
      {
        'skywind3000/gutentags_plus',
        config = function()
          vim.g.gutentags_plus_nomap = true
        end,
        after = 'vim-gutentags'
      }
    },
    config = function()
      require("mnvim.gutentags").config()
    end
  }
  use {
    'brookhong/cscope.vim',
    opt = true
  }
  use {
    'preservim/tagbar',
    config = function()
      -- TODO: See if you can convert this to lua
      vim.cmd('source ~/.config/nvim/vim_scripts/tagbar_configs.vim')
    end,
    cmd = { 'TagbarToggle' }
  }
  use {
    'skywind3000/asynctasks.vim',
    config = function()
      vim.g.asynctasks_profile = "zsh"
      -- vim.g.asynctasks_term_pos = "bottom"
      -- vim.g.asynctasks_term_rows = 10
      -- vim.g.asynctasks_term_cols = 80
    end,
    requires = { "GustavoKatel/telescope-asynctasks.nvim" }
  }
  use {
    'skywind3000/asyncrun.vim',
    config = function()
      vim.g.asyncrun_open = 6
      vim.g.asyncrun_rootmarks = { '.git', '.svn', '.root', '.project', '.hg', '.vim', 'compile_commands.json',
        '.catkin_workspace' }
    end,
    requires = { "GustavoKatel/telescope-asynctasks.nvim" }
  }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-repeat' }
  use { 'justinmk/vim-sneak',
    -- setup = [[require('sneak_configs')]],
    setup = function()
      vim.g['sneak#label'] = 1
      vim.g['sneak#s_next'] = 1
      vim.g['sneak#use_ic_scs'] = 1
      vim.g['sneak#prompt'] = "🔎"

      vim.cmd([[
      " Change the colors
      highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
      highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow
      ]])
    end,
    event = 'VimEnter'
  }
  use {
    'unblevable/quick-scope',
    -- setup = [[require('quickScope_configs')]],
    setup = function()
      -- Trigger a highlight in the appropriate direction when pressing these keys:
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
      vim.g.qs_max_chars = 150
      vim.cmd([[
      highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
      highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline
      ]])
    end,
    keys = { 'f', 'F', 't', 'T' }
  }
  use {
    'matze/vim-move',
    setup = function()
      vim.g.move_key_modifier = "A"
    end
  }
  use { 'wellle/targets.vim' }
  use { 'b3nj5m1n/kommentary', keys = { { 'n', 'gcc' }, { 'n', 'gc' }, { 'v', 'gc' } } }
  use {
    's1n7ax/nvim-comment-frame',
    config = function()
      require('nvim-comment-frame').setup({
        disable_default_keymap = true,
      })
    end,
    opt = true
  }
  use {
    'junegunn/vim-easy-align',
    config = function()
      vim.g.easy_align_delimiters = { -- copied from lewis6991 configs
        [';']  = { pattern = ';', left_margin = 0 },
        ['[']  = { pattern = '[', left_margin = 1, right_margin = 0 },
        [']']  = { pattern = ']', left_margin = 0, right_margin = 1 },
        [',']  = { pattern = ',', left_margin = 0, right_margin = 1 },
        [')']  = { pattern = ')', left_margin = 0, right_margin = 0 },
        ['(']  = { pattern = '(', left_margin = 0, right_margin = 0 },
        ['=']  = { pattern = [[<\?=>\?]], left_margin = 1, right_margin = 1 },
        ['|']  = { pattern = [[|\?|]], left_margin = 1, right_margin = 1 },
        ['&']  = { pattern = [[&\?&]], left_margin = 1, right_margin = 1 },
        [':']  = { pattern = ':', left_margin = 1, right_margin = 1 },
        ['?']  = { pattern = '?', left_margin = 1, right_margin = 1 },
        ['<']  = { pattern = '<', left_margin = 1, right_margin = 0 },
        ['>']  = { pattern = '>', left_margin = 1, right_margin = 0 },
        ['\\'] = { pattern = '\\', left_margin = 1, right_margin = 0 },
        ['+']  = { pattern = '+', left_margin = 1, right_margin = 1 }
      }
    end,
    opt = true
  }
  use {
    'chipsenkbeil/distant.nvim',
    config = function()
      require('distant').setup {
        ['*'] = require('distant.settings').chip_default()
      }
    end,
    cmd = { 'DistantLaunch', 'DistantOpen', 'DistantInstall' }
  }

  use {
    'jamestthompson3/nvim-remote-containers',
    cmd = { 'AttachToContainer', 'BuildImage', 'StartImage' }
  }
  use { 'szw/vim-maximizer' }
  use {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn["mkdp#util#install_sync"]()
    end,
    ft = { 'markdown' }
  }
  use { 'SweiLz/ROS-Snippets' }
  use { 'pijaro/ros-snippets', disable = true }
  use { 'rafamadriz/friendly-snippets' }
  use { 'puremourning/vimspector', opt = true }
  use { 'ap/vim-css-color', event = 'BufEnter' }


  use { 'neovim/nvim-lspconfig', after = 'cmp-nvim-lsp', config = [[require("mnvim.nvimlsp")]] }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'hrsh7th/nvim-cmp', event = 'InsertEnter *', config = [[require("mnvim.nvimcmp")]] }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
  use { 'folke/lua-dev.nvim' }
  use { 'hrsh7th/vim-vsnip', event = 'InsertEnter' }
  use { 'hrsh7th/vim-vsnip-integ', after = 'vim-vsnip' }
  use { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
  use { 'windwp/nvim-autopairs', after = 'nvim-cmp', config = [[require("mnvim.autopairs")]] }
  use { 'onsails/lspkind-nvim' }
  use { 'hrsh7th/cmp-calc', after = 'nvim-cmp' }
  use { 'quangnguyen30192/cmp-nvim-tags', after = 'nvim-cmp' }
  use { 'kdheepak/cmp-latex-symbols', after = 'nvim-cmp', disable = true }
  use { 'ray-x/cmp-treesitter', after = 'nvim-cmp', disable = true }
  use { 'f3fora/cmp-spell', after = 'nvim-cmp', disable = true }
  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
    end,
  }
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require('lsp_signature').setup()
    end
  }
  use { "SmiteshP/nvim-navic" }

  use { 'ThePrimeagen/refactoring.nvim', disable = true } --This is not complete yet and i will use it in future.
  use { 'dstein64/vim-startuptime', cmd = 'StartupTime', config = [[vim.g.startuptime_tries = 100]] }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
