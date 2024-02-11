local telescope = require("telescope")

telescope.setup({
	pickers = {
		find_files = {
			theme = "ivy",
			previewer = true,
			layout_config = {
				height = 17,
			},
			border = true,
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { " " },
			},
		},
		git_files = {
			theme = "ivy",
			previewer = true,
			layout_config = {
				height = 17,
			},
			border = true,
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { " " },
			},
		},
		grep_string = {
			theme = "ivy",
			previewer = true,
			layout_config = {
				height = 17,
			},
			border = true,
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { " " },
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = false,
			previewer = true,
			layout_config = {
				height = 17,
			},
			display_stat = { date = false, size = true, mode = false },
			border = true,
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { " " },
			},
		},
	},
})

telescope.load_extension("file_browser")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>.", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep: ") })
end)
vim.keymap.set("n", "<leader>,", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
