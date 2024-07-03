require("neogit").setup()

-- Bind to keys
vim.keymap.set("n", "<leader>gs", vim.cmd.Neogit, { desc =  "Open neogit" })
