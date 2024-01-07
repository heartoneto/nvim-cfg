-- local lsp = require('lsp-zero')
local rt = require('rust-tools')
local dap = require('dap')
local mason_registry = require('mason-registry')
local codelldb = mason_registry.get_package("codelldb")

local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb.exe"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dll"


local opts = {
	dap = {
		adapter = dap.adapters.codelldb,
	},
	server = {
		-- standalone = false,
		capabilities = require('lsp-zero').get_capabilities(),
		on_attach = function(_, bufnr)
			-- Hover hover_actions
			vim.keymap.set("n", "<leader>ca", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<leader>ga", rt.code_action_group.code_action_group,
				{ buffer = bufnr })
		end,
	},
	hover_actions = {
		auto_focus = true,
	},
}


rt.setup(opts)

-- rt.inlay_hints.set()
-- rt.inlay_hints.enable()
