local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function()
	-- Packer just manages itself
	use 'wbthomason/packer.nvim'

	-- nvim LSP configs
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'williamboman/nvim-lsp-installer'

	----------------
	-- Plugin development
	----------------
	-- Work in progress. Using upstream by default:
	use 'jpmcb/nvim-go'
	-- If working locally, comment out above 
	-- and uncomment below. Replace path with appropriate working local config
	--use '~/workspace/nvim-go'

	-- Luasnip (primarily for hrsh7th/nvim-cmp)
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	-- Load spicy gruvbox color theme
	use 'gruvbox-community/gruvbox'

	-- Treesitter is life
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Gaze deeply into the unknown
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	--Use fzf native for telescope
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	
	-- nvim file tree. Alternative to NerdTree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		config = function() require'nvim-tree'.setup {} end
	}

	-- Git stuff
	use 'airblade/vim-gitgutter'

	-- comment stuff out
	use 'preservim/nerdcommenter'

	-- Time Pope is a god
	use 'tpope/vim-surround'
	use 'tpope/vim-fugitive'

	-- Yanking manager (yeah yeah I know, registers exist)
	use {
		"AckslD/nvim-neoclip.lua",
		requires = { {'nvim-telescope/telescope.nvim'} },
		config = function()
			require('neoclip').setup()
		end,
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.theta'.config)
		end
	}

	--use {
		--'startup-nvim/startup.nvim',
		--requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
		--config = function()
			--require('startup').setup()
		--end,
	--}

	use {'mg979/vim-visual-multi'}

	-- Typescript. Oh Typescript. Where art thou Typescript.
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'

    -- Rust
	use 'simrat39/rust-tools.nvim'
	use 'mfussenegger/nvim-dap'
	use 'nvim-lua/popup.nvim'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
