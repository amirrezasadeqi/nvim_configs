local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

local notify_opts = {
  stages = "static",
  timeout = 1000,
}
local M = {}
function M.config()
  vim.notify = notify
  notify.setup(notify_opts)
end

return M
