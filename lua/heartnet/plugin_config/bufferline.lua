local bf = require('bufferline')
vim.opt.termguicolors = true

bf.setup({
	options = {
		-- mode = "tabs",
		mode = "buffers",
		-- Use this for diagnogstics
		diagnogstics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " "
					or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
		-- Set the separator type
		separator_style = "thin",

		-- Don't draw over this buffers
		offsets = {
			{
				filetype = "NvimTree",
				separator = true,
			},
			{
				filetype = "undotree",
				name = "Undotree",
				separator = true,
			},
		},

		-- Filter buffers
		custom_filter = function(buf_number, buf_numbers)
			local fname = vim.fn.bufname(buf_number)
			local fext = vim.bo[buf_number].filetype

			local cmp = fext ~= "fugitive" or fext ~= "undotree"
			return cmp

			-- if cmp then
			-- 	return true
			-- end
			--
		end,
	}
})

-- Bufferline pick
vim.keymap.set('n', '<leader>bp', vim.cmd.BufferLinePick, { desc = 'Bufferline pick' })
vim.keymap.set('n', '<leader>bP', vim.cmd.BufferLinePickClose, { desc = 'Bufferline close' })
vim.keymap.set('n', '<leader>bco', vim.cmd.BufferLineCloseOthers, { desc = 'Bufferline close others' })

-- Swith buffers
vim.keymap.set('n', '<leader>bb', vim.cmd.BufferLineCyclePrev, { desc = 'Bufferline go to prev buffer' })
vim.keymap.set('n', '<leader>bf', vim.cmd.BufferLineCycleNext, { desc = 'Bufferline go to next buffer' })
