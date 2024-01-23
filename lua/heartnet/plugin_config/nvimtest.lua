local nt = require("neotest")
nt.setup({
	adapters = {
		require("neotest-rust")
	}
})

-- Keybindings
vim.keymap.set("n", "<leader>to", function() nt.output_panel.toggle() end, { desc = "Toggle test output panel" })
vim.keymap.set("n", "<leader>ts", function() nt.summary.toggle() end, { desc = "Toggle summary" })
vim.keymap.set("n", "<leader>tr", function() nt.run.run() end, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>td", function() nt.run.run({ strategy = "dap" }) end, { desc = "Debug nearest test" })
