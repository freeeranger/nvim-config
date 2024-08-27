local telescope = require("telescope")

telescope.setup({})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>.", function()
    builtin.find_files({
        find_command = {
            "rg",
            "--files",
            "--ignore-case",
            "--glob", "!*.class",
            "--glob", "!*.lst",
            "--glob", "!*.jar",
            "--glob", "!*.app",
            "--glob", "!*.exe",
            "--glob", "!*.import"
        }
    })
end)

vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
vim.keymap.set("n", "gr", builtin.lsp_references, {})
