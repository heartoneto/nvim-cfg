-- Trouble is the plugin for lsp warning/errors
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = 'Diagnostics (current buffer)' })
vim.keymap.set("n", "<leader>xt", "<cmd>Trouble diagnostics toggle<cr>", { desc = 'Diagnostics (Trouble)' })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = 'Location list (Trouble)' })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = 'Quickfix list (Trouble)' })

