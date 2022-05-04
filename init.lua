-- Leader key is a space
vim.g.mapleader = " "

-- Setup globals that should always be around
-- See `./lua/globals
require "globals.options"
require "globals.remaps"

require "lsp.lsp"

require 'plugins.packer'

-- Local dev of nvim-go
require 'nvim-go'.setup()

--vim.api.nvim_create_autocmd({"BufWrite"}, {
	--pattern = {"*.go"},
	--command = "echo 'Entering a Go file'",
--})
