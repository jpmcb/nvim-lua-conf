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
lspconfig.ts_ls.setup({})

-- ESLint
local customizations = {
	{ rule = 'style/*',   severity = 'off', fixable = true },
	{ rule = 'format/*',  severity = 'off', fixable = true },
	{ rule = '*-indent',  severity = 'off', fixable = true },
	{ rule = '*-spacing', severity = 'off', fixable = true },
	{ rule = '*-spaces',  severity = 'off', fixable = true },
	{ rule = '*-order',   severity = 'off', fixable = true },
	{ rule = '*-dangle',  severity = 'off', fixable = true },
	{ rule = '*-newline', severity = 'off', fixable = true },
	{ rule = '*quotes',   severity = 'off', fixable = true },
	{ rule = '*semi',     severity = 'off', fixable = true },
}

-- Enable eslint for all supported languages
lspconfig.eslint.setup(
	{
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"vue",
			"html",
			"markdown",
			"json",
			"jsonc",
			"yaml",
			"toml",
			"xml",
			"gql",
			"graphql",
			"astro",
			"svelte",
			"css",
			"less",
			"scss",
			"pcss",
			"postcss"
		},
		settings = {
			-- Silent the stylistic rules in you IDE, but still auto fix them
			rulesCustomizations = customizations,
		},
	}
)

-- Astro
lspconfig.astro.setup({})

-- python
lspconfig.ruff.setup({})
lspconfig.pyright.setup({
	--settings = {
	--python = {
	--analysis = {
	--ignore = { "*" }, -- Using Ruff
	--},
	--},
	--},
})

--lspconfig.denols.setup({})
