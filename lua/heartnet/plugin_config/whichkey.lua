local wk = require("which-key")

wk.setup {
	plugins = {
		marks = true, -- shows a list of marks on ' and `
		registers = true, -- shows your registerns on " in NORMAL or <C-r> in INSERT mode
		presets = {
			operators = true,
			motions = true,
			text_objects = true,

			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds
			g = true, -- bindings prefixed with g
		}
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 0, 0, 0, 0 },
	}
}

wk.register({
	a = {
	},

	b = {
		name = "Bufferline",
		p = "Pick buffer",
		P = "Pick close buffer",
		co = "Close other buffers",
	},

	c = {
		a = { "Code actions" },
	},

	d = {
		name = "Debug",
	},

	e = {
	},

	f = {
		name = "Find",
	},

	g = {
		-- name = "Git",
		s = { "Show fugitive (Git)" },
		d = { "Go to definition" },
		f = { "Go to file definition" },
		cc = { "Comment code" }
	},

	h = {
		name = "Harpoon",
		a = { "Add current file" },
		s = { "Show Harpoon" },
	},

	i = {
	},

	j = {
	},

	k = {
	},

	l = {
		s = "Ft-selector",
	},

	m = {
	},

	n = {
	},

	o = {
	},

	p = {
		name = "Peek",
		d = { "Function definition" },
		D = { "Class definition" },
	},

	q = {
	},

	r = {
		name = "References",
		f = { "Find references" },
	},

	s = {
		-- name = "Swap",
		b = "Swap previous parameter",
		w = "Swap next parameter",
		i = "Symbol information",
	},


	t = {
		name = "NvimTree",
		f = { "Focus tree" },
		t = { "Toggle tree" },
	},

	x = {
		name = "Problems", -- optional group name
		t = { "Code Diagnostics" },
		l = { "LOC List" },
		w = { "Workspace" },
		d = { "Documents" },
	},

	y = {
	},

	z = {
	},

}, { prefix = "<leader>" })
