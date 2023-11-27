-- Trouble is the plugin for lsp warning/errors
vim.keymap.set("n", "<leader>xt", "<cmd>TroubleToggle<CR>", { desc = 'Show code diagnoctics'} )
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", { desc = 'Show code diagnoctics'}) 
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = 'Show workspace diagnoctics'})
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = 'Show document diagnoctics'})
