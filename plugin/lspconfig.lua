local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- Go
lspconfig.gopls.setup({
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod", "gotmpl", "go.mod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

-- Lua
lspconfig.lua_ls.setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},

					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				},
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end,
})

-- Zig
lspconfig.zls.setup({})

-- Terraform
lspconfig.terraformls.setup({})
lspconfig.tflint.setup({})

-- Typescript
lspconfig.tsserver.setup({})
