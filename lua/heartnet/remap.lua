-- Set <leader>
vim.g.mapleader = " "

-- Netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- vim.keymap.set("n", "J", "mzJ`z")

-- scroll up & down, set the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- cursor in the middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
