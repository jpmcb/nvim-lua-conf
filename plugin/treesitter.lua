local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
	return
end

-- nvim-treesitter's old `nvim-treesitter.configs` module was removed on the
-- new main branch. Parser installation is now handled by `install()` and
-- highlighting is enabled through Neovim's built-in `vim.treesitter.start()`.
treesitter.setup()

treesitter.install({
	"go",
	"hurl",
	"markdown",
	"markdown_inline",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"go",
		"hurl",
		"markdown",
	},
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})
