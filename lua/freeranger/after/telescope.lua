local telescope = require('telescope')

telescope.setup{
    pickers = {
        find_files = {
            theme = "ivy",
            previewer = true,
            layout_config = {
                height = 15,
            },
            border = true,
            borderchars = {
                prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                results = { " " },
                preview = { " "},
            }
        },
        git_files = {
            theme = "ivy",
            previewer = true,
            layout_config = {
                height = 15,
            },
            border = true,
            borderchars = {
                prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                results = { " " },
                preview = { " "},
            }
        },
        grep_string = {
            theme = "ivy",
            previewer = true,
            layout_config = {
                height = 15,
            },
            border = true,
            borderchars = {
                prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                results = { " " },
                preview = { " "},
            }
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep: ")})
end)
