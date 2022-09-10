local M = {}
function M.config()
  require("formatter").setup {
    filetype = {
      lua = { require("formatter.filetypes.lua").stylua },
      python = { require("formatter.filetypes.python").autopep8 },
      c = { require("formatter.filetypes.c").clangformat },
      cpp = { require("formatter.filetypes.cpp").clangformat },
      cmake = { require("formatter.filetypes.cmake").cmakeformat },
      json = { require("formatter.filetypes.json").prettier },
      yaml = { require("formatter.filetypes.yaml").prettier },
      markdown = { require("formatter.filetypes.markdown").prettier },
      rust = { require("formatter.filetypes.rust").rustfmt },
      sh = { require("formatter.filetypes.sh").shfmt }
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    },
  }
  local FormatAutogroup = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePost", {
    command = "FormatWrite",
    group = FormatAutogroup
  })
end

return M
