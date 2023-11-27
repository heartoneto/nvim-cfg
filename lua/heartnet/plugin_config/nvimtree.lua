local nvtree = require('nvim-tree').setup()

-- Toggle the tree
vim.keymap.set('n', '<leader>tt', vim.cmd.NvimTreeToggle, { desc = 'Toggle nvim-tree' })
-- Focus the tree
vim.keymap.set('n', '<leader>tf', vim.cmd.NvimTreeFocus, { desc = 'Focus the nvim-tree' })

-- Open the tree on the current openend buffer
-- vim.keymap.set('n', '<leader>tc', vim.cmd.NvimTreeFindFile, { desc = 'Show current buffer on nvim-tree' })
