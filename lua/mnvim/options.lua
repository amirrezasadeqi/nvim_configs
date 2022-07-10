local options = {
  number = true,
  relativenumber = true,
  numberwidth = 4,
  mouse = 'a',
  clipboard = 'unnamedplus',
  syntax = "enable",
  termguicolors = true,
  cursorline = true,
  cursorcolumn = true,
  signcolumn = "yes",
  backup = false,
  writebackup = false,
  wrap = false,
  encoding = "utf-8",
  fileencoding = "utf-8",
  ruler = true,
  splitbelow = true,
  splitright = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  smarttab = true,
  expandtab = true,
  smartindent = true,
  autoindent = true,
  cmdheight = 2,
  showmode = false,
  pumheight = 10,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
