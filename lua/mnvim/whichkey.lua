local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local vopts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  f = {
    name = "Fuzzy Finder [Telescope]",
    f = { "<cmd>Telescope find_files<cr>", "Find Files" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  },
  i = {
    i = { "<cmd>nohlsearch<cr>", "No Highlight" },
  },
  b = {
    d = { "<cmd>bdelete!<cr>", "Close Buffer" },
  }
}
local vmappings = {}
-- local unstruct_nmappings = {}
local unstruct_imappings = {
  i = {
    i = { "<ESC>", "Escape", mode = "i" },
  }
}
local unstruct_vmappings = {
  i = {
    i = { "<ESC>", "Escape", mode = "x" },
  }
}

local setup = {
  plugins = {
    marks = true,
    registers = true,
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = true,
      z = true,
      g = true,
    },
    spelling = { enabled = true, suggestions = 20 }
  }
}

local M = {}

function M.config()
  which_key.setup(setup)
  which_key.register(mappings, opts)
  which_key.register(vmappings, vopts)
  which_key.register(unstruct_imappings)
  which_key.register(unstruct_vmappings)
end

return M
