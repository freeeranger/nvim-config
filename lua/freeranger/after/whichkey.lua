vim.opt.timeout = true
vim.opt.timeoutlen = 300

local which_key = require("which-key")

which_key.setup()

which_key.register({
	["."] = {
		"Find file",
	},
	[","] = {
		"Browse files",
	},
	f = {
		name = "File",
		f = { "Netrw" },
		s = { "Find string " },
	},
	b = {
		name = "Buffer",
		o = { "Open buffer" },
		n = { "New buffer" },
		d = { "Set cwd" },
		x = { "Close buffer" },
	},
	c = {
		name = "Code",
		r = { "Rename" },
		a = { "Action" },
	},
	g = {
		name = "Git",
		w = { "Open git window" },
		s = { "Status" },
		a = { "Add current file" },
		A = { "Add all files" },
		r = { "Reset current file" },
		R = { "Reset all files" },
		c = { "Commit" },
		p = { "Push" },
		l = { "Pull" },
		x = {
			name = "Advanced",
			a = { "Add, commit and push everything" },
			i = { "Completely setup a repo" },
		},
		i = { "Initialize" },
	},
	o = {
		name = "Open",
		c = { "Config directory" },
		e = { "Trouble" },
		l = { "Lazy" },
		m = { "Mason" },
		u = { "Undo tree" },
		a = { "Alpha" },
	},
}, { prefix = "<leader>" })
