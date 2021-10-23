require 'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- Default text-objects defined in textobjects.scm of the plugin.
        ['<Leader>af'] = "@function.outer",
        ['<Leader>if'] = "@function.inner",
        ['<Leader>aC'] = "@class.outer",
        ['<Leader>iC'] = "@class.inner",
        ['<Leader>ac'] = '@conditional.outer',
        ['<Leader>ic'] = '@conditional.inner',
        ['<Leader>ab'] = '@block.outer',
        ['<Leader>ib'] = '@block.inner',
        ['<Leader>al'] = '@loop.outer',
        ['<Leader>il'] = '@loop.inner',
        ['<Leader>as'] = '@statement.outer',
        ['<Leader>is'] = '@statement.inner',
        ['<Leader>ad'] = '@comment.outer',
        ['<Leader>ar'] = '@call.outer',
        ['<Leader>ir'] = '@call.inner',
        -- custom-defined text-objects in
        -- ~/.config/nvim/after/queries/<language>/textobjects.scm
        ['<Leader>iF'] = { -- an example of custom text-object
          cpp = "@function.name",
        },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<Leader>swn'] = '@parameter.inner',
      },
      swap_previous = {
        ['<Leader>swp'] = '@parameter.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'double',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
  refactor = {
    -- highlights under-cursor and its usages
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "gsr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        -- Uses lsp as fallback for nvim-treesitter
        goto_definition_lsp_fallback = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<Leader>gnn',
			node_incremental = '<Leader>grn',
			scope_incremental = '<Leader>gsn',
			node_decremental = '<Leader>grm',
		},
	},
	playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = true, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}





