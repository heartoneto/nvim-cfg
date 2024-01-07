-- Install Packer if needed
vim.cmd [[packadd packer.nvim]]

-- Make sure Packer is loaded
local loaded, packer = pcall(require, "packer")
if not loaded then
	return
end

-- Run on init
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end
	},
}

-- Load these plugins
return packer.startup(function(use)
	-- Packer: plugin manager manages itself
	use 'wbthomason/packer.nvim'

	-- Telescope: fuzzy finder
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	-- Treesitter: syntax colorizer
	use {
		'nvim-treesitter/nvim-treesitter',
		{ run = ':TSUpdate' }
	}

	--- Code context using Treesitter
	use {
		'nvim-treesitter/nvim-treesitter-context'
	}

	-- use {
	-- 	'nvim-treesitter/nvim-treesitter-textobjects',
	-- 	after = 'nvim-treesitter',
	-- 	requires = 'nvim-treesitter/nvim-treesitter'
	-- }

	-- Harpoon: fav files
	use('theprimeagen/harpoon')

	-- UndoTree: easy undo
	use('mbbill/undotree')

	-- Fugitive: git integration
	use('tpope/vim-fugitive')

	-- LuaLine: a status bar under the buffer
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons' }
	}

	-- Nvim-tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = { 'nvim-tree/nvim-web-devicons' },
	}

	-- Vim notify replacement
	use { 'rcarriga/nvim-notify' }


	-- LSPZero: lsp integration
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },    -- Required
			{ 'williamboman/mason.nvim' },  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },    -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	}

	-- Line comments	
	use 'terrortylor/nvim-comment'

	-- Enclose text with characters
	use "tpope/vim-surround"

	-- Diagnogstics & problems
	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end
	}

	-- Auto install & configure debuggers from Mason
	use {
		"jay-babu/mason-nvim-dap.nvim",
		requires = {
			'williamboman/mason.nvim',
			'mfussenegger/nvim-dap',
		}
	}

	-- Debugger
	use {
		'nvim-telescope/telescope-dap.nvim',

		requires = {
			'nvim-telescope/telescope.nvim',
			'mfussenegger/nvim-dap',
		}
	}

	-- Debugger UI
	use {
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap",
		}
	}

	-- WichKey
	use 'folke/which-key.nvim'

	-- Buferline
	use { 'akinsho/bufferline.nvim', tag = '*', requires = 'nvim-tree/nvim-web-devicons' }

	-- Ufo (Ultra fold)
	use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

	-- Indent blankline
	use "lukas-reineke/indent-blankline.nvim"

	-- Dashboard
	use {
		'nvimdev/dashboard-nvim', event = 'VimEnter', requires = { 'nvim-tree/nvim-web-devicons' }
	}

	-- Rust dev
	use { 'simrat39/rust-tools.nvim', requires = 'neovim/nvim-lspconfig' }

	-- Flutter Dev
	use {
		"akinsho/flutter-tools.nvim", requires = {
		'nvim-lua/plenary.nvim',
		'stevearc/dressing.nvim',
	} }

	-- color schemes
	use({ 'rose-pine/neovim', as = 'rose-pine' })
	use 'folke/tokyonight.nvim'
	use 'EdenEast/nightfox.nvim'
	use 'tomasiser/vim-code-dark'
	use { "catppuccin/nvim", as = "catppuccin" }

	-- Own plugins
	use "G:\\Work\\ft-selector"
end)
