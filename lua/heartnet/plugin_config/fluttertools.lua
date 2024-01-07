local ft = require('flutter-tools')
local dap = require('dap')
local lsp_zero = require('lsp-zero')

local opts = {
	debugger = {
		enabled = true,
		run_via_dap = false,
	},
	lsp = {
		on_attach = function(_, bufnr)
		end,
		capabilities = lsp_zero.get_capabilities(),
	},
	decorations = {
		statusline = {
			-- Show the current device in the status line
			device = true,
		},
	},
}

ft.setup(opts)
