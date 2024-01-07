local lsp_config = require('lspconfig')
local lsp_zero = require('lsp-zero')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

-- Star from the default
lsp_zero.preset('recommended')

local cmp = require('cmp')
-- local cmp_action = lsp.cmp_action()

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- Confirm/Abort selection
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<esc>'] = cmp.mapping.abort(),

		-- Navigation
		['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
		['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),

		['<C-j>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
		['<C-k>'] = cmp.mapping.select_next_item({ behavior = 'select' }),

		-- Ctrl+space to show autocomplete menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Navigate snippets
		-- ['<C-w>'] = cmp_action.luasnip_jump_forward(),
		-- ['<C-b>'] = cmp_action.luasnip_jump_backward(),

		['C-k'] = cmp.mapping.scroll_docs(-4),
		['C-j'] = cmp.mapping.scroll_docs(4),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' }
	})
})

lsp_zero.on_attach(function(_, buf)
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
	bind("n", "<leader>kf", function() vim.lsp.buf.hover() end, opts)

	-- Workspace symbol info
	bind("n", "<leader>ww", function() vim.lsp.buf.workspace_symbol() end, opts)

	-- View definition
	-- bind("n", "<leader>ld", function() vim.lsp.buf.open_float() end, opts)

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
	bind("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	bind("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
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

-- Utility functions shared between progress reports for LSP and DAP
local client_notifs = {}

local function get_notif_data(client_id, token)
	if not client_notifs[client_id] then
		client_notifs[client_id] = {}
	end

	if not client_notifs[client_id][token] then
		client_notifs[client_id][token] = {}
	end

	return client_notifs[client_id][token]
end


local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

local function update_spinner(client_id, token)
	local notif_data = get_notif_data(client_id, token)

	if notif_data.spinner then
		local new_spinner = (notif_data.spinner + 1) % #spinner_frames
		notif_data.spinner = new_spinner

		notif_data.notification = vim.notify("", vim.log.levels.INFO, {
			hide_from_history = true,
			icon = spinner_frames[new_spinner],
			replace = notif_data.notification,
		})

		vim.defer_fn(function()
			update_spinner(client_id, token)
		end, 100)
	end
end

local function format_title(title, client_name)
	return client_name .. (#title > 0 and ": " .. title or "")
end

local function format_message(message, percentage)
	return (percentage and percentage .. "%\t" or "") .. (message or "")
end

-- LSP integration
-- Make sure to also have the snippet with the common helper functions in your config!

vim.lsp.handlers["$/progress"] = function(_, result, ctx)
	local client_id = ctx.client_id
	local val = result.value

	if not val.kind then
		return
	end

	local notif_data = get_notif_data(client_id, result.token)

	if val.kind == "begin" then
		local message = format_message(val.message, val.percentage)

		if notif_data then
			notif_data.notification = vim.notify(message, vim.log.levels.INFO, {
				title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
				replace = notif_data.notification,
				timeout = 3000,
			})
		else
			notif_data.notification = vim.notify(message, vim.log.levels.INFO, {
				title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
				icon = spinner_frames[1],
				timeout = false,
				hide_from_history = false,
			})
		end

		notif_data.spinner = 1
		update_spinner(client_id, result.token)
	elseif val.kind == "report" and notif_data then
		notif_data.notification = vim.notify(format_message(val.message, val.percentage), vim.log.levels.INFO, {
			replace = notif_data.notification,
			hide_from_history = false,
		})
	elseif val.kind == "end" and notif_data then
		notif_data.notification =
			vim.notify(val.message and format_message(val.message) or "Complete", vim.log.levels.INFO, {
				icon = "",
				replace = notif_data.notification,
				timeout = 3000,
			})

		notif_data.spinner = nil
	end
end

-- table from lsp severity to vim severity.
local severity = {
	"error",
	"warn",
	"info",
	"info", -- map both hint and info to info?
}

vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
	vim.notify(method.message, severity[params.type])
end
