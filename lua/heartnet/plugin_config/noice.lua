local notify = require("notify")

notify.setup({
	background_colour = "#000000",
})

require("noice").setup()

-- Open the notification history using telescope
local bind = vim.keymap.set

-- -- show the notification history using telescope
local function show_notification_history()
	require('noice').cmd("history")
end

bind('n', '<leader>nh', show_notification_history, { desc = 'Show notification history' })
