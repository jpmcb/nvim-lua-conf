local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function()
    use 'github/copilot.vim'
	-- Packer just manages itself
	use 'wbthomason/packer.nvim'

     -- LSP bridge glue for Mason
    use 'jose-elias-alvarez/null-ls.nvim'

	-- nvim LSP configs
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        run = ":MasonUpdate", -- :MasonUpdate updates registry contents
    }

    -- Visualize lsp progress
    use({
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end
    })

    -- Noevim DAP server:
    -- https://github.com/mfussenegger/nvim-dap
    use 'mfussenegger/nvim-dap'

    -- LSP vscode like icons
    use 'onsails/lspkind-nvim'

    -- Completions engine
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

    -- Lua snippet engine (primarily to fufill requirements in hrsh7th/nvim-cmp)
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	----------------
	-- Plugin development
	----------------
	-- Work in progress. Using upstream by default:
	use 'jpmcb/nvim-go'
	-- If working locally, comment out above 
	-- and uncomment below. Replace path with appropriate working local config
	--use '~/workspace/nvim-go'

    -- Local llama development
    use '~/workspace/nvim-llama'

	-- Load spicy gruvbox color theme
	--use 'gruvbox-community/gruvbox'
    -- Tokyo night theme
    use 'folke/tokyonight.nvim'

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

    -- Powerful, fast auto-pairing
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
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
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'

    -- Prettier daemon for faster ts/css/js formatting
    -- Needs to be installed on system: $ npm install -g @fsouza/prettierd
    use 'MunifTanjim/prettier.nvim'

    -- Rust tooling
	use 'simrat39/rust-tools.nvim'
	use 'mfussenegger/nvim-dap' -- What you do?
	use 'nvim-lua/popup.nvim' -- What you do?

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end

    -- Writing plugins # TODO
end)
