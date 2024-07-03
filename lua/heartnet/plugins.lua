-- Stor3etup Lazy
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

-- Add the lazy folder to the path
vim.opt.rtp:prepend(lazypath)

-- Load these plugins
require("lazy").setup({
		-- Telescope: fuzzy finder
		{
			'nvim-telescope/telescope.nvim',
			tag = '0.1.5',
			dependencies = { 'nvim-lua/plenary.nvim' }
		},

		-- Treesitter: syntax colorizer
		{
			'nvim-treesitter/nvim-treesitter',
			build = ':TSUpdate',
		},

		-- Navigate to a tmux pane
		{
			'christoomey/vim-tmux-navigator',
		},

		--- Code context using Treesitter
		{
			'nvim-treesitter/nvim-treesitter-context',
		},

		-- Harpoon: fav files
		{
			'ThePrimeagen/harpoon',
			branch = "harpoon2",
			dependencies = { 'nvim-lua/plenary.nvim' }
		},

		-- UndoTree: easy undo
		{
			'mbbill/undotree',
		},

		-- Git integration
		-- Neogit
		{
			"NeogitOrg/neogit",
			branch = "master",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"sindrets/diffview.nvim",

				-- Optional
				'nvim-telescope/telescope.nvim',
			}
		},

		-- Fugitive:
		-- {
		-- 	'tpope/vim-fugitive',
		-- },

		-- Gitsigns
		{
			'lewis6991/gitsigns.nvim',
		},

		-- LuaLine: a status bar under the buffer
		{
			'nvim-lualine/lualine.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' }
		},

		-- Nvim-tree
		{
			lazy = true,
			'nvim-tree/nvim-tree.lua',
			dependencies = { 'nvim-tree/nvim-web-devicons' },
		},

		-- Vim notify replacement
		{
			"folke/noice.nvim",
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			}
		},

		-- LSPZero: lsp integration
		{
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v3.x',
			dependencies = {
				-- LSP Support
				{ 'neovim/nvim-lspconfig' }, -- Required
				{ 'williamboman/mason.nvim' }, -- Optional
				{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

				-- Autocompletion
				{ 'hrsh7th/nvim-cmp' }, -- Required
				{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
				{ 'hrsh7th/cmp-buffer' }, -- Optional
				{ 'hrsh7th/cmp-path' }, -- Optional
				{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
				{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

				-- Snippets
				-- { 'L3MON4D3/LuaSnip',                 version = "v2.*", build = "make install_jsregexp" }, -- Required
				{ 'L3MON4D3/LuaSnip',                 version = "v2.*" }, -- Required
				{ 'rafamadriz/friendly-snippets' },           -- Optional
			}
		},

		-- Line comments	
		'terrortylor/nvim-comment',

		-- Enclose text with characters
		"tpope/vim-surround",

		-- Todo comments
		{
			"folke/todo-comments.nvim",
			dependencies = { 'nvim-lua/plenary.nvim' },
			lazy = false,
		},

		-- Test runner
		{
			"nvim-neotest/neotest",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"antoinemadec/FixCursorHold.nvim",
				"nvim-treesitter/nvim-treesitter",

				-- Test adapters
				"rouge8/neotest-rust",
			}
		},

		-- Diagnogstics & problems
		{
			"folke/trouble.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			opts = {},
			cmd = "Trouble",
		},

		-- Auto install & configure debuggers from Mason
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = {
				'williamboman/mason.nvim',
				'mfussenegger/nvim-dap',
			}
		},

		-- Debugger
		{
			'nvim-telescope/telescope-dap.nvim',

			dependencies = {
				'nvim-telescope/telescope.nvim',
				'mfussenegger/nvim-dap',
			}
		},

		-- Debugger UI
		{
			"rcarriga/nvim-dap-ui",
			dependencies = {
				"mfussenegger/nvim-dap",
				"nvim-neotest/nvim-nio",
			}
		},

		-- WichKey
		'folke/which-key.nvim',

		-- Buferline
		{ 'akinsho/bufferline.nvim', version = '*',                              dependencies = 'nvim-tree/nvim-web-devicons' },

		-- Ufo (Ultra fold)
		{ 'kevinhwang91/nvim-ufo',   dependencies = 'kevinhwang91/promise-async' },

		-- Indent blankline
		{
			"lukas-reineke/indent-blankline.nvim",
		},

		-- Dashboard
		-- {
		-- 	'nvimdev/dashboard-nvim',
		-- 	event = 'VimEnter',
		-- 	lazy = false,
		-- 	config = function()
		-- 		local mod = require("dashboard")
		-- 		mod.setup {}
		--
		-- 		vim.cmd("Dashboard")
		-- 	end,
		-- 	dependencies = { { 'nvim-tree/nvim-web-devicons' } }
		-- },

		-- Rust dev
		{ 'simrat39/rust-tools.nvim', dependencies = 'neovim/nvim-lspconfig' },

		-- Flutter Dev
		{
			"akinsho/flutter-tools.nvim",
			dependencies = {
				'nvim-lua/plenary.nvim',
				'stevearc/dressing.nvim',
			}
		},

		-- color schemes
		({ 'rose-pine/neovim', name = 'rose-pine' }),
		'folke/tokyonight.nvim',
		'EdenEast/nightfox.nvim',
		'tomasiser/vim-code-dark',
		{ "catppuccin/nvim",          name = "catppuccin" },
	},
	{
		concurrency = 2,
	}
)
