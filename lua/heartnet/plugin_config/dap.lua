local dap = require('dap')
local dapui = require('dapui')

-- Make sure nvim-tree is loaded
local nvtree = require('nvim-tree')

-- Configure dapui
dapui.setup()

-- Hook dapui to dap events
dap.listeners.after.event_initialized['dapui_config'] = function()
	-- Close nvim-tree before opening dapui
	vim.cmd.NvimTreeClose()
    dapui.open()
end

dap.listeners.after.event_terminated['dapui_config'] = function()
	-- Close nvim-tree before opening dapui
	vim.cmd.NvimTreeClose()
	dapui.close()
end

dap.listeners.after.event_exited['dapui_config'] = function()
	-- Close nvim-tree before opening dapui
	vim.cmd.NvimTreeClose()
	dapui.close()
end

-- Set this icons for breakpoints
vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

-- Keybindings
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "Debug: Toggle breakpoint", noremap = true })
vim.keymap.set("n", "<leader>dx", ":DapTerminate<CR>", { desc = "Debug: Terminate ", noremap = true })
vim.keymap.set("n", "<leader>di", ":DapStepInto<CR>", { desc = "Debug: StepInto", noremap = true })
vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>", { desc = "Debug: StepOver", noremap = true })
vim.keymap.set("n", "<leader>de", ":DapContinue<CR>", { desc = "Debug: Continue", noremap = true })

