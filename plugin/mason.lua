require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"astro",
		"gopls",
		"lua_ls",
		"rust_analyzer",
		"zls",
	},
})
