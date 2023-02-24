local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local function open_nvim_tree(data)
	local IGNORED_FT = {
		"dashboard",
	}

	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	-- TODO: if you can make these two if statements one.
	if not no_name and not directory then
		return
	end

	-- &ft
	local filetype = vim.bo[data.buf].ft

	-- skip ignored filetypes
	if vim.tbl_contains(IGNORED_FT, filetype) then
		return
	end

	-- change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end

	-- open the tree
	require("nvim-tree.api").tree.open()
end

local M = {}

function M.config()
	nvim_tree.setup({
		update_cwd = true,
	})
	-- From nvim-tree.lua wiki instead of deprecated options
	vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
end

return M
