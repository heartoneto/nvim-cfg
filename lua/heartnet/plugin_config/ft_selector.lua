require("ft-selector").setup()

vim.keymap.set("n", "<leader>ls", ":SelectFT<CR>", { desc = "Select filetype", noremap = true })

