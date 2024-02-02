require 'nvim-treesitter.configs'.setup({
	-- make sure these are installed
	ensure_installed = { "vim", "lua", "rust", "toml" },

	-- allow async installation for langs
	sync_install = false,

	-- allow auto install for langs
	auto_install = false,

	-- enable highlighting for this plugin, disable vim default
	highlight = {
		enable = true,

		-- disable default vim highlighting
		additional_vim_regex_highlighting = false,
	},

	--
	-- incremental_selection = {
	--     enable = true,
	--     keymaps = {
	--         init_selection = "<leader>ts",
	--         node_incremental = "<leader>w",
	--         node_decremental = "<leader>b",
	--         scope_incremental = false,
	--     },
	-- },

	-- this depends requires nvim-treesitter-textobjects being installed
	-- textobjects = {
	--     lsp_interop = {
	--         enable = true,
	--         border = 'none',
	--         floating_preview_opts = {},
	--         peek_definition_code = {
	--             ["<leader>pd"] = { desc = "Peek function definition", query = "@function.outer" },
	--             ["<leader>pD"] = { desc = "Peek class definition", query = "@class.outer" },
	--         },
	--     },
	--     select = {
	--         enable = true,
	--
	--         -- Automatically jump forward to textobj, similar to targets.vim
	--         lookahead = true,
	--
	--         keymaps = {
	--             -- You can use the capture groups defined in textobjects.scm
	--             ["af"] = { query = "@function.outer", desc = "Select outer function" },
	--             ["if"] = { query = "@function.inner", desc = "Select inner function" },
	--             ["ac"] = { query = "@class.outer", desc = "Select outer class" },
	--             ["ic"] = { query = "@class.inner", desc = "Select inner class" },
	--
	--             ["ap"] = { query = "@parameter.outer", desc = "Select outer parameter" },
	--             ["ip"] = { query = "@parameter.inner", desc = "Select inner parameter" },
	--
	--             -- You can optionally set descriptions to the mappings (used in the desc parameter of
	--             -- nvim_buf_set_keymap) which plugins like which-key display
	--             -- You can also use captures from other query groups like `locals.scm`
	--             ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
	--         },
	--
	--         -- You can choose the select mode (default is charwise 'v')
	--         --
	--         -- Can also be a function which gets passed a table with the keys
	--         -- * query_string: eg '@function.inner'
	--         -- * method: eg 'v' or 'o'
	--         -- and should return the mode ('v', 'V', or '<c-v>') or a table
	--         -- mapping query_strings to modes.
	--         selection_modes = {
	--             ['@parameter.outer'] = 'v', -- charwise
	--             ['@function.outer'] = 'V',  -- linewise
	--             ['@class.outer'] = '<c-v>', -- blockwise
	--         },
	--         -- If you set this to `true` (default is `false`) then any textobject is
	--         -- extended to include preceding or succeeding whitespace. Succeeding
	--         -- whitespace has priority in order to act similarly to eg the built-in
	--         -- `ap`.
	--         --
	--         -- Can also be a function which gets passed a table with the keys
	--         -- * query_string: eg '@function.inner'
	--         -- * selection_mode: eg 'v'
	--         -- and should return true of false
	--         include_surrounding_whitespace = false,
	--     },
	--     move = {
	--         enable = true,
	--         -- set jumps in the jumplist
	--         set_jumps = true,
	--         goto_next_start = {
	--             [']m'] = { query = "@function.outer", desc = "Go to outer function start" },
	--             [']]'] = { query = "@class.outer", desc = "Go to outer class start" },
	--             [']o'] = { query = "@loop.*", desc = "Go to next start of outer loop start" },
	--         },
	--         goto_next_end = {
	--             [']M'] = { query = "@function.outer", desc = "Go to outer function end" },
	--             [']}'] = { query = "@class.outer", desc = "Go to outer class end" },
	--             [']O'] = { query = "@loop.*", desc = "Go to next end of outer loop end" },
	--         },
	--
	--     },
	--     swap = {
	--         enable = true,
	--         swap_next = {
	--             ['<leader>sw'] = { query = "@parameter.inner", desc = "Swap next parameter" },
	--         },
	--         swap_previous = {
	--             ['<leader>sb'] = { query = "@parameter.inner", desc = "Swap next parameter" },
	--         },
	--     },
	-- },
})
