local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
    'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['C-p'] = cmp.mapping.select_prev_item(cmp_select),
    ['C-n'] = cmp.mapping.select_next_item(cmp_select),
    ['C-y'] = cmp.mapping.confirm({ select = true }),
    --- Autocomplete
    ['C-Space'] = cmp.mapping.complete(),
})

-- lsp.set_preferences({
-- 	sign_icons = { }
-- })

lsp.on_attach(function(client, buf)
    local opts = { buffer = buf, remap = false }
    local bind = vim.keymap.set;

    -- Format code
    bind("n", "fmt", function() vim.lsp.buf.format { async = true } end, opts)

    -- Go to definition
    bind("n", "gd", function() vim.lsp.buf.definition() end, opts)
    
    -- Go to file definition
    bind("n", "gf", function() vim.lsp.file.definition() end, opts)
    
    -- Symbol info
    bind("n", "<leader>si", function() vim.lsp.buf.hover() end, opts)

    -- Workspace symbol info
    bind("n", "<leader>ww", function() vim.lsp.buf.workspace_symbol() end, opts)

    -- View definition
    bind("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)

    -- Go to on errors?
    -- bind("n", "[g", function() vim.lsp.buf.goto_next() end, opts)
    -- bind("n", "]g", function() vim.lsp.buf.goto_prev() end, opts)

    -- Code action
    bind("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

    -- Find references
    bind("n", "<leader>ref", function() vim.lsp.buf.rererences() end, opts)

    -- Rename symbol
    bind("n", "<F2>", function() vim.lsp.buf.rename() end, opts)

    -- -- Signature help in insert mode
    bind("i", "<C-i>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- run the lsp
lsp.setup()
