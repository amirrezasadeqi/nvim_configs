-- LSP settings
local nvim_lsp = require 'lspconfig'
local lsp_installer = require("nvim-lsp-installer")

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Install and Enable the following language servers. some of them need specific
-- options so we will override their configs in on_server_ready function. also some
-- servers are not available via lsp installer and you must install them manually,
-- like arduino-lanuage-server.
local servers = { 'clangd', 'pyright', 'bashls', 'cmake', 'jsonls', 'texlab', 'sumneko_lua', 'vimls', 'lemminx', 'yamlls', 'rust_analyzer', 'arduino_language_server' }

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
	}

	-- check if any custom server_opts exist for the LSP server, if so, load them, if not, use our default_opts
	server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)
	-- vim.cmd([[ do User LspAttachBuffers ]])
end)

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
  },
}






