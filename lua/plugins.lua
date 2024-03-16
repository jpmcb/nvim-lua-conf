-- Install lazy.nvim for package management if it's not found on the system
-- Requires git to be installed.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	-- only on justfile extensions
	{ "NoahTheDuke/vim-just" },

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- LSP bridge glue for Mason
	{ "jose-elias-alvarez/null-ls.nvim" },

	-- nvim LSP configs
	{ "neovim/nvim-lspconfig" },

	-- Visualize lsp progress
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},

	-- Noevim DAP server:
	-- https://github.com/mfussenegger/nvim-dap
	{ "mfussenegger/nvim-dap" },

	-- LSP vscode like icons
	{ "onsails/lspkind-nvim" },

	-- Completions engine
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },

	-- Lua snippet engine (primarily to fufill requirements in hrsh7th/nvim-cmp)
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},

	{ "saadparwaiz1/cmp_luasnip" },

	-- Work in progress. Using upstream by default:
	{
		"jpmcb/nvim-go",
		config = function()
			require("nvim-go").setup()
		end,
	},
	-- If working locally, comment out above
	-- and uncomment below. Replace path with appropriate working local config
	--{ dir = "~/workspace/nvim-go" },

	-- Local llama development
	{
		dir = "~/workspace/nvim-llama",
		config = function()
			require("nvim-llama").setup({})
		end,
	},

	-- Additional color themes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	{ "gruvbox-community/gruvbox", lazy = true },
	{ "catppuccin/nvim", lazy = true },

	-- Treesitter is life
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Gaze deeply into the unknown
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	--Use fzf native for telescope
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	{ "kyazdani42/nvim-web-devicons" },

	-- nvim file tree. Alternative to NerdTree
	{ "kyazdani42/nvim-tree.lua" },

	-- Powerful, fast auto-pairing
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	{ "airblade/vim-gitgutter" },

	-- comment stuff out
	{ "preservim/nerdcommenter" },

	-- Time Pope is a god
	{ "tpope/vim-surround" },
	{ "tpope/vim-fugitive" },

	{ "nvim-lualine/lualine.nvim" },

	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.theta").config)
		end,
	},

	{ "mg979/vim-visual-multi" },

	-- Typescript. Oh Typescript. Where art thou Typescript.
	{ "jose-elias-alvarez/nvim-lsp-ts-utils" },

	-- Prettier daemon for faster ts/css/js formatting
	-- Needs to be installed on system: $ npm install -g @fsouza/prettierd
	{ "MunifTanjim/prettier.nvim" },

	-- Rust tooling
	{ "simrat39/rust-tools.nvim" },
	{ "mfussenegger/nvim-dap" },
	{ "nvim-lua/popup.nvim" },

	{ "stevearc/conform.nvim" },

	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Astro treesitter parsing bindings
	{ "virchau13/tree-sitter-astro" },
})
