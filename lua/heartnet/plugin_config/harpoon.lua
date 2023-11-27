local mark = require('harpoon.mark')
local term = require('harpoon.term')
local ui = require('harpoon.ui')


-- vim.keymap.set("n", "<leader>tt", term.gotoTerminal(1))

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = 'Add current file to harpoon' } )
vim.keymap.set("n", "<leader>hs", ui.toggle_quick_menu, { desc = 'Show harpoon UI'})
-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)


