local telescope = require('telescope');

telescope.setup({
	defaults = {
		-- ignore the git folder
		file_ignore_patterns = {
			".git/*",
		},
	}
})

local builtin = require('telescope.builtin')

-- Fuzzy search  fall
vim.keymap.set('n', '<leader>fa', builtin.find_files, { desc = 'Find in all files' })

-- Fuzzy search git
vim.keymap.set('n', '<leader>fs', builtin.git_files, { desc = 'Find in git files' })

-- Fuzzy current buffer
vim.keymap.set('n', '<leader>fh', builtin.current_buffer_fuzzy_find, { desc = 'Find in current buffer' })

-- Fuzzy in all open buffers
vim.keymap.set('n', '<leader>fp', builtin.buffers, { desc = 'Find in all opened buffers' })

-- Fuzzy search commands
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Find in commands' })

-- Fuzzy search key bindings
vim.keymap.set('n', '<leader>fb', builtin.keymaps, { desc = 'Find in key bindings' })

-- Fuzzy search in treesitter
vim.keymap.set('n', '<leader>fr', builtin.treesitter, { desc = "Find in treesitter symbols" })

-- Live search 
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live search" })


-- Show marks
-- vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = "Find in marks" })
