require("ft-selector").setup()

require('telescope')
require('telescope.builtin')

local bind = vim.keymap.set
bind("n", "<leader>ls", ":SelectFT<CR>", { desc = "Select filetype", noremap = true })

-- bind("n", "<leader>ls", function()
-- 	builtin.filetypes()
-- end, { desc = "Select filetype", noremap = true })
