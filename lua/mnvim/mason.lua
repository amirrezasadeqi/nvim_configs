--[[###########################################################
--		              Mason Configs
--		          contains lsp configs
--###########################################################]]

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
    -- TODO: does not attaches to buffers!!?? temporarily use jedi_language_server instead
		-- "pyright", 
    "jedi_language_server",
		"bashls",
		"cmake",
		"jsonls",
		"texlab",
		"lua_ls",
		"vimls",
		"lemminx",
		"yamlls",
		"rust_analyzer",
		"arduino_language_server",
	},
})

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
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
	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end
end

require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach_lsp_keymaps,
			capabilities = capabilities,
		})
	end,
	["clangd"] = function()
		require("lspconfig").clangd.setup({
			on_attach = on_attach_lsp_keymaps,
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--background-index",
				-- By default, clang-tidy uses -checks=clang-diagnostic-*,clang-analyzer-*
				-- to add more checks, create .clang-tidy file in the root directory
				-- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
				-- TODO: In future I will add a default .clang-tidy file to the tasks of
				-- creating c/cpp and ros projects.
				"--clang-tidy",
				"--cross-file-rename",
			},
			root_dir = require("lspconfig").util.root_pattern(
				".git",
				"compile_commands.json",
				"compile_flags.txt",
				".catkin_workspace"
			),
		})
	end,
	["lua_ls"] = function()
		if vim.g.wlua == "neovim" then
			-- folke/neodev.nvim setups for lua_ls
			require("neodev").setup({})
		end
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach_lsp_keymaps,
			capabilities = capabilities,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
	end,
})
