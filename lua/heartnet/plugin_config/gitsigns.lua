require('gitsigns').setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "-" },
		topdelefe = { text = "-" },
		changedelete = { text = "~" },
	},
})

local bind = vim.keymap.set

bind("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview git change" })
bind("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle git line blame" })
