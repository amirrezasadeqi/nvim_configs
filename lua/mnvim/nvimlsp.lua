--[[###########################################################
--		              LSP Configs
--###########################################################]]

local nvim_lsp = require("lspconfig")
local navic = require("nvim-navic")
require("lspconfig").clangd.setup({
	on_attach = function(client, bufnr)
		navic.attach(client, bufnr)
	end,
})
local lsp_installer = require("nvim-lsp-installer")

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Install and Enable the following language servers. some of them need specific
-- options so we will override their configs in on_server_ready function. also some
-- servers are not available via lsp installer and you must install them manually,
-- like arduino-lanuage-server.
local servers = {
	"clangd",
	"pyright",
	"bashls",
	"cmake",
	"jsonls",
	"texlab",
	"sumneko_lua",
	"vimls",
	"lemminx",
	"yamlls",
	"rust_analyzer",
	"arduino_language_server",
}

-- automatic installation of LSP servers. this must be before the
-- on_server_ready function.
for _, name in pairs(servers) do
	local ok, server = lsp_installer.get_server(name)
	-- Check that the server is supported in nvim-lsp-installer
	if ok then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

local on_attach_lsp_keymaps = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>e",
		"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>so",
		[[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
		opts
	)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
	navic.attach(client, bufnr)
end

-- folke/neodev.nvim setups for sumneko LSP
local luadev = require("neodev").setup({
	lspconfig = {
		on_attach = on_attach_lsp_keymaps,
		capabilities = capabilities,
	},
})

-- on_server_ready sets up LSPs.
lsp_installer.on_server_ready(function(server)
	-- Default options
	-- Note: These are automatically setup from nvim-lspconfig. See https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
	local default_opts = {
		on_attach = on_attach_lsp_keymaps,
		capabilities = capabilities,
	}

	-- Table of custom LSP configuration. overrides are here!
	local server_opts = {
		["sumneko_lua"] = function()
			if vim.g.wlua == "neovim" then
				return luadev
			else
				return default_opts
			end
		end,
		["clangd"] = function()
			default_opts.cmd = {
				"clangd",
				"--background-index",
				-- By default, clang-tidy uses -checks=clang-diagnostic-*,clang-analyzer-*
				-- to add more checks, create .clang-tidy file in the root directory
				-- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
				-- TODO: In future I will add a default .clang-tidy file to the tasks of
				-- creating c/cpp and ros projects.
				"--clang-tidy",
				"--cross-file-rename",
			}
			default_opts.root_dir =
				nvim_lsp.util.root_pattern(".git", "compile_commands.json", "compile_flags.txt", ".catkin_workspace")
			return default_opts
		end,
	}

	-- check if any custom server_opts exist for the LSP server, if so, load them, if not, use our default_opts
	server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)
