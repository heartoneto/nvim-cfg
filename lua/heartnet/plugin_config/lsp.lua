local lsp_config = require('lspconfig')
local lsp_zero = require('lsp-zero')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

-- Star from the default
lsp_zero.preset('recommended')

local luasnip = require('luasnip')
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({

	-- what to do expand a snippet
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	-- define our own keybindings
	mapping = cmp.mapping.preset.insert({
		-- Confirm/Abort selection
		['<C-o>'] = cmp.mapping.confirm({ select = false }),
		['<CR>'] = cmp.mapping.confirm({ select = false }),

		-- Abort selection
		['<C-q>'] = cmp.mapping.abort(),
		['<esc>'] = cmp.mapping.abort(),

		-- Navigation
		['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
		['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),

		['<C-k>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
		['<C-j>'] = cmp.mapping.select_next_item({ behavior = 'select' }),

		-- Ctrl+space to show autocomplete menu
		['<C-Space>'] = cmp.mapping.complete(),

		['<C-w>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),

		['C-j'] = cmp.mapping.scroll_docs(4),
		['C-k'] = cmp.mapping.scroll_docs(-4),
	}),

	-- define the completion sources
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' }
	}),

	-- config the popup window
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	}
})

-- what todo when an LSP gets attached
lsp_zero.on_attach(function(_, buf)
	local opts = { buffer = buf, remap = false }

	-- make binding easy
	local bind = vim.keymap.set;

	-- Format code
	bind("n", "fmt", function() vim.lsp.buf.format { async = true } end, opts)

	-- Go to definition
	bind("n", "<F12>", function() vim.lsp.buf.definition() end, opts)

	-- View definition
	bind("n", "<F11>", function() vim.lsp.buf.open_float() end, opts)

	-- Go to file definition
	bind("n", "<leader>gf", function() vim.lsp.file.definition() end, opts)

	-- Symbol info
	bind("n", "<leader>kf", function() vim.lsp.buf.hover() end, opts)

	-- Workspace symbol info
	bind("n", "<leader>ww", function() vim.lsp.buf.workspace_symbol() end, opts)

	-- Go to on errors?
	-- bind("n", "<leader>[g", function() vim.lsp.buf.goto_next() end, opts)
	-- bind("n", "<leader>]g", function() vim.lsp.buf.goto_prev() end, opts)

	-- Code action
	bind("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

	-- Find references
	bind("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)

	-- Rename symbol
	bind("n", "<F2>", function() vim.lsp.buf.rename() end, opts)

	-- -- Signature help in normal or insert mode
	bind({ "i", "n" }, "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Icons to display on the left column
lsp_zero.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

-- This makes ufo works
lsp_zero.set_server_config({
	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true
			}
		}
	}
})

-- Setup Mason
mason.setup({})
mason_lspconfig.setup({

	-- make sure these servers are installed
	ensure_installed = {
		'lua_ls',
		'rust_analyzer',
	},
	handlers = {
		-- the default handler
		lsp_zero.default_setup,

		-- specific handler for lua
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			lsp_config.lua_ls.setup(lua_opts)
		end,
	},
})
