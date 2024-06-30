-- Load tdc
local tdc = require("todo-comments")

-- Configure tdc
tdc.setup({})

local function jump_prev()
	tdc.jump_prev()
end

local function jump_next()
	tdc.jump_next()
end

-- Jumps to the previous todo
vim.keymap.set("n", "[t", jump_prev, { desc = "Prev todo" })

-- Jumps to the next todo
vim.keymap.set("n", "]t", jump_next, { desc = "Next todo" })
