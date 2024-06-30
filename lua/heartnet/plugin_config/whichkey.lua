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
		b = "Cycle active buffer",
		P = "Pick close buffer",
		co = "Close other buffers",
		p = "Pick buffer",
	},

	c = {
		a = { "Code actions" },
	},

	d = {
		name = "Debug",
		b = { "Toggle breakpoint" },
		e = { "Continue" },
		i = { "Step into" },
		o = { "Step over" },
		x = { "End debug session" },
	},

	e = {
	},

	f = {
		mt = {
			"Format code",
		}
	},

	g = {
		name = "Git",
		c = { "Comment code block" },
		cc = { "Comment line" },
		d = { "Go to definition" },
		f = { "Go to file definition" },
		s = { "Show fugitive (Git)" },
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
		s = { "Kill search" },
		f = { "Symbol info" },
	},

	l = {
	},

	m = {
	},

	n = {
		name = "Notification",
		h = { "Notification history" },
	},

	o = {
	},

	p = {
	},

	q = {
	},

	r = {
		name = "References",
		f = { "Find references" },
	},

	s = {
	},

	t = {
		name = "NvimTree/Tests",

		-- Nvimtree
		f = { "Focus tree" },
		t = { "Toggle tree" },

		-- Neotests
		e = { "Test summary" },
	},

	u = {
		name = "Show/hide Undotree",
	},

	v = {
		v = { "View vefinition" },
	},

	x = {
		name = "Problems", -- optional group name
		t = { "Documents" },
	},

	y = {
	},

	z = {
	},
}, { prefix = "<leader>" })
