local nvtree = require('nvim-tree').setup()

-- Toggle the tree
vim.keymap.set('n', '<leader>tr', vim.cmd.NvimTreeToggle, {})
-- Focus the tree
vim.keymap.set('n', '<leader>tf', vim.cmd.NvimTreeFocus, {})

