require('gitsigns').setup({})

local bind = vim.keymap.set

bind("n", "<leader>gp", ":Gitsigns preview_hunk <CR>", { desc = "Preview git change" })
