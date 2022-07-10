local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local M = {}

function M.config()
  nvim_tree.setup({
    open_on_setup = true,
    ignore_ft_on_setup = { 'dashboard' },
    update_cwd = true
  })
end

return M
