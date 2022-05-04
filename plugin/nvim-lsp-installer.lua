-- Reference: https://github.com/williamboman/nvim-lsp-installer

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
})

-- Register a handler that will be called for each installed server
-- when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
	local opts = {}

	if server.name == "gopls" then
		opts = {
			cmd = {"gopls", "serve"},
			filetypes = { "go", "gomod", "gotmpl", "go.mod" },
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
		}
	elseif server.name == "sumneko_lua" then
		opts.settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' }
				}
			}
		}
	elseif server.name == "tsserver" then

	end

	-- This setup() function will take the provided server configuration and decorate it with the necessary properties
	-- before passing it onwards to lspconfig.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

