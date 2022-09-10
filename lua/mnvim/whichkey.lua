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
  ["\\"] = {
    s = {
      f = {
        i = { ":call CscopeFindInteractive(expand('<cword>'))<CR>", "InterActive symbol finder" },
        l = { ":call ToggleLocationList()<CR>", "Toggle Location List" },
        s = { ":call CscopeFind('s', expand('<cword>'))<CR>", "Find symbol" },
        g = { ":call CscopeFind('g', expand('<cword>'))<CR>", "find symbol def" },
        d = { ":call CscopeFind('d', expand('<cword>'))<CR>", "find functions called by this" },
        c = { ":call CscopeFind('c', expand('<cword>'))<CR>", "find functions calling this" },
        t = { ":call CscopeFind('t', expand('<cword>'))<CR>", "find text" },
        e = { ":call CscopeFind('e', expand('<cword>'))<CR>", "find somethings" },
        f = { ":call CscopeFind('f', expand('<cword>'))<CR>", "find file undercursor" },
        I = { ":call CscopeFind('i', expand('<cword>'))<CR>", "find files include this file" },
      },
    },
    c = {
      s = { ":GscopeFind s <C-R><C-W><cr>", "Find Symbol Reference UnderCursor" },
      g = { ":GscopeFind g <C-R><C-W><cr>", "Find Symbol Def UnderCursor" },
      c = { ":GscopeFind c <C-R><C-W><cr>", "Functions Calling This function" },
      t = { ":GscopeFind t <C-R><C-W><cr>", "Find this text string" },
      e = { ":GscopeFind e <C-R><C-W><cr>", "Find this egrep pattern" },
      f = { ":GscopeFind f <C-R>=expand(\" < cfile > \")<cr><cr>", "Find file under cursor" },
      i = { ":GscopeFind i <C-R>=expand(\" < cfile > \")<cr><cr>", "Find files including this file" },
      d = { ":GscopeFind d <C-R><C-W><cr>", "Find functions called by this function" },
      a = { ":GscopeFind a <C-R><C-W><cr>", "Find places this symbol is assigned a value" },
      z = { ":GscopeFind z <C-R><C-W><cr>", "Find current word in ctags database" },

    },
  },
  ["<space>"] = {
    t = { ":lua require('telescope').extensions.asynctasks.all()<cr>", "List of Asynctask to run" },
  },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  f = {
    name = "Fuzzy Finder [Telescope]",
    f = { "<cmd>Telescope find_files<cr>", "Find Files" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    n = { '<Plug>Sneak_f', "sneak f" },
  },
  F = {
    n = { '<Plug>Sneak_F', "sneak F" },
  },
  g = {
    a = { "<Plug>(EasyAlign)", "EasyAlign" },
  },
  i = {
    i = { "<cmd>nohlsearch<cr>", "No Highlight" },
  },
  b = {
    d = { "<cmd>bdelete!<cr>", "Close Buffer" },
  },
  c = {
    f = { ":lua require('nvim-comment-frame').add_comment()<cr>", "Adding a comment frame" },
    m = { ":lua require('nvim-comment-frame').add_multiline_comment()<cr>", "Adding a multi-line comment frame" },
  },
  s = {
    n = { '<Plug>Sneak_s', "sneak s" },
  },
  S = {
    n = { '<Plug>Sneak_S', "sneak S" },
  },
  t = {
    r = { "<cmd>Trouble workspace_diagnostics<cr>", "Toggle Diagnostics" },
    m = {
      name = "Vimux Keybinds",
      r = { "<cmd>VimuxPromptCommand<cr>", "Prompts for Terminal Command" },
      l = { "<cmd>VimuxRunLastCommand<cr>", "Run the last Terminal Command" },
      c = { "<cmd>VimuxCloseRunner<cr>", "Close Tmux Pane" },
    },
    n = { '<Plug>Sneak_t', "sneak t" },
  },
  T = {
    n = { '<Plug>Sneak_T', "sneak T" },
  },
  u = {
    t = { "<cmd>UndotreeToggle<cr>", "Toggle Undo-Tree" },
  },
  k = {
    k = { ":AsyncStop<cr>", "Stop the asynctaks" },
    t = { ":!killall -9 roscore && killall -9 rosmaster<Cr>", "Killing roscore" },
  },

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
  },
  g = {
    a = { "<Plug>(EasyAlign)", mode = "x" }
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
