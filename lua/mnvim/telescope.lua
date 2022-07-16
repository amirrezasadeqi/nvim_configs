local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local telescope_configs = {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    layout_config = {
      width = 0.75,
      preview_cutoff = 120,
      horizontal = {
        preview_width = function(_, cols, _)
          if cols < 120 then
            return math.floor(cols * 0.5)
          end
          return math.floor(cols * 0.55)
        end,
        mirror = false,
      },
      vertical = { mirror = false },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
  pickers = {
    -- live_grep = {
    --   --@usage don't include the filename in the search results
    --   only_sort_text = true,
    -- },
  },
}


local M = {}
function M.config()
  telescope.setup(telescope_configs)
  -- To get fzf loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  pcall(function()
    telescope.load_extension('fzf')
  end)
  -- pcall(function()
  --   telescope.load_extension('notify')
  -- end)
  -- pcall(function()
  --   telescope.load_extension('neoclip')
  -- end)
  -- pcall(function()
  --   telescope.load_extension('project')
  -- end)
  -- pcall(function()
  --   telescope.load_extension('vim_bookmarks')
  -- end)
end

return M
