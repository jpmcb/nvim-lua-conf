require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"gopls",
		"lua_ls",
		"prettierd",
		"rust_analyzer",
		"staticcheck",
		"stylua",
		"zls",
	},
})
