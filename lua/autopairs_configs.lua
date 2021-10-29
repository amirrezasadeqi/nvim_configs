--###################################################################
--			nvim-autopairs configs
--###################################################################

require('nvim-autopairs').setup({
  check_ts = true,
  enable_check_bracket_line = true,
  fast_wrap = {},
})

-- If you want insert `(` after select function or method item
require('cmp').event:on( 'confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())



