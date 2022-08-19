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

  use { 'ThePrimeagen/refactoring.nvim', disable = true } --This is not complete yet and i will use it in future.
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
