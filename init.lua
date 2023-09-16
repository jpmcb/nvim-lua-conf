-- Leader key is a space
vim.g.mapleader = " "

-- Lua configurations
-- See lua files under './lua/'

-- Setup globals that should always be around
require "options"
require "remaps"

-- For configuring the global neovim LSP
require "lsp"

-- For installing plugins via packer
require "plugins"

-- Local dev of nvim-go
require 'nvim-go'.setup()

--vim.api.nvim_create_autocmd({"BufWrite"}, {
	--pattern = {"*.go"},
	--command = "echo 'Entering a Go file'",
--})
