local status, prettier = pcall(require, "prettier")

if not status or vim.fn.executable("prettierd") ~= 1 then
	return
end

prettier.setup({
	bin = "prettierd",
	filetypes = {
		"css",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"scss",
		"less",
	},
})
