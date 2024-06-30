local notify = require("notify")

notify.setup({
	background_colour = "#000000",
})

local noice = require("noice")
noice.setup({})

-- show the notification history using telescope

-- local function show_notification_history()
-- 	noice.cmd("history")
-- end

vim.keymap.set('n', '<leader>nh', function()
	noice.cmd("history")
end, { desc = 'Show notification history' })
