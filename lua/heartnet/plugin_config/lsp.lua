local lsp = require('lsp-zero')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

local lua_opts = lsp.nvim_lua_ls()
require('lspconfig').lua_ls.setup(lua_opts)

-- Star from the default
lsp.preset('recommended')

local cmp = require('cmp')
-- local cmp_action = lsp.cmp_action()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- Confirm selection
		['<C-y>'] = cmp.mapping.confirm({ select = false }),
		['<esc>'] = cmp.mapping.abort(),
		['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
		['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),

		-- Ctrl+space to show autocomplete menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Navigate snippets
		-- ['<C-w>'] = cmp_action.luasnip_jump_forward(),
		-- ['<C-b>'] = cmp_action.luasnip_jump_backward(),

		['C-k'] = cmp.mapping.scroll_docs(-4),
		['C-j'] = cmp.mapping.scroll_docs(4),
	})
})

lsp.on_attach(function(_, buf)
	local opts = { buffer = buf, remap = false }

	-- make binding easy
	local bind = vim.keymap.set;

	-- Format code
	bind("n", "fmt", function() vim.lsp.buf.format { async = true } end, opts)

	-- Go to definition
	bind("n", "<F12>", function() vim.lsp.buf.definition() end, opts)

	-- Go to file definition
	bind("n", "<leader>gf", function() vim.lsp.file.definition() end, opts)

	-- Symbol info
	bind("n", "<leader>bf", function() vim.lsp.buf.hover() end, opts)

	-- Workspace symbol info
	bind("n", "<leader>ww", function() vim.lsp.buf.workspace_symbol() end, opts)

	-- View definition
	bind("n", "<leader>ld", function() vim.lsp.buf.open_float() end, opts)

	-- Go to on errors?
	bind("n", "<leader>[g", function() vim.lsp.buf.goto_next() end, opts)
	bind("n", "<leader>]g", function() vim.lsp.buf.goto_prev() end, opts)

	-- Code action
	bind("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

	-- Find references
	bind("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)

	-- Rename symbol
	bind("n", "<F2>", function() vim.lsp.buf.rename() end, opts)

	-- -- Signature help in normal or insert mode
	bind("n", "<C-i>", function() vim.lsp.buf.signature_help() end, opts)
	bind("i", "<C-i>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- This makes ufo works
lsp.set_server_config({
	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true
			}
		}
	}
})

-- run the lsp
lsp.setup()

-- Setup Mason
mason.setup({})
mason_lspconfig.setup({
	ensure_installed = {
		'rust_analyzer',
	},
	handlers = {
		lsp.default_setup,
	},
})
