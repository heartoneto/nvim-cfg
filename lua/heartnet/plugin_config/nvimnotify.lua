-- set this plugins as the notification backend
vim.notify = require("notify")

local bind = vim.keymap.set;

-- show the notification history using telescope
local function show_notification_history()
	require('telescope').extensions.notify.notify({})
end

bind('n', '<leader>nh', show_notification_history, { desc = 'Show notification history' })
