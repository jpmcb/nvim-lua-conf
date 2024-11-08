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
	-- nice, modern folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
	},

	-- soft wrapping
	{
		"andrewferrier/wrapping.nvim",
		config = function()
			require("wrapping").setup()
		end,
	},

	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		opts = {
			workspaces = {
				{
					name = "OpenSauced",
					path = "~/Documents/OpenSauced",
				},
			},
		},
	},

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

	--{
		--dir = "~/workspace/rip-and-tear.nvim",
		--config = function()
			--require('rip-and-tear').setup({
			  --mp3_file = '/Users/jpmcb/Downloads/rip-and-tear.mp3',  -- Update this path
			  --player_command = 'mpg123',                  -- Change if using 'afplay' or 'cvlc'
			  --delay = 1000,                               -- Adjust the delay as needed
			--})
		--end
--},

	-- Local llama development
	{
		dir = "~/workspace/nvim-llama",
		config = function()
			require("nvim-llama").setup({})
		end,
	},

	-- Color themes
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
	},
	{
		"gruvbox-community/gruvbox",
		name = "gruvbox",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},

	-- Treesitter is life
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		ensure_installed = {
			"markdown_inline",
			"go",
		},
		auto_install = true,
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

	{
		"folke/trouble.nvim",
		branch = "dev", -- IMPORTANT!
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
		opts = {}, -- for default options, refer to the configuration section for custom setup.
	},
})
