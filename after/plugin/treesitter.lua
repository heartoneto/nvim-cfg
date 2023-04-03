require 'nvim-treesitter.configs'.setup({
    -- make sure these are installed
    ensure_installed = { "vim", "lua", "rust", "toml" },

    -- allow asunc installation for langs
    sync_install = false,

    -- allow auto install for langs
    auto_install = false,

    -- enable highlighting for this plugin, disable vim default
    highlight = {
        enable = true,

        -- disable default vim highlighting
        additional_vim_regex_highlighting = false,
    }
})--        
