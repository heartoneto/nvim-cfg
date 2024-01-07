vim.notify = require("notify").setup({

})

local bind = vim.keymap.set;

local function show_notification_history()
	require('telescope').extensions.notify.notify({})
end

bind('n', '<leader>nh', show_notification_history, { desc = 'Show notification history' })
