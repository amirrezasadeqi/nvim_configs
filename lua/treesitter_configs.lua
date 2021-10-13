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

	incremental_selection = {
		enable = true,
		--[[
		keymaps = {
			init_selection = ",nn",
			node_incremental = ",mn",
			scope_incremental = ",mc",
			node_decremental = ",mm",

		},]]

	},
	playground = {
    		enable = true,
   		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    		persist_queries = false, -- Whether the query persists across vim sessions
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





