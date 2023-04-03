vim.cmd [[packadd packer.nvim]]

-- Load these plugins
return require('packer').startup(function(use)
    -- Packer: plugin manager manages itself
    use 'wbthomason/packer.nvim'

    -- Telescope: fuzzy finder
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Treesitter: syntax colorizer
    use {
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    }

    -- use({ 'nvim-treesitter/playground' })

    -- Harpoon: fav files
    use('theprimeagen/harpoon')

    -- UndoTree: easy undo
    use('mbbill/undotree')

    -- Fugitive: git integration
    use('tpope/vim-fugitive')

    -- Airline: status bar
    use('vim-airline/vim-airline')
    use { 'vim-airline/vim-airline-themes',
        requires = {
            { 'vim-airline/vim-airline' },
        }
    }

    -- Nvim-tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            { 'nvim-tree/nvim-web-devicons', },
        },
    }

    -- LSPZero: lsp integration
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    -- Line comments	
    use 'terrortylor/nvim-comment'

    -- Enclose text with characters
    use "tpope/vim-surround"

    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup()
        end
    }
    
    -- color schemes
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use 'folke/tokyonight.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'tomasiser/vim-code-dark'
end)
