local telescope = require("telescope")

telescope.setup({})

local builtin = require("telescope.builtin")
local utils = require('plenary.job')

local function is_git_repo()
    local result = utils:new({
        command = "git",
        args = { "rev-parse", "--is-inside-work-tree" },
        cwd = vim.fn.getcwd()
    }):sync()
    return result[1] == "true"
end

-- vim.keymap.set("n", "<leader>.", function()
--     if is_git_repo() then
--         builtin.git_files()
--     else
--         builtin.find_files()
--     end
-- end, {})
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
        }
    })
end)

vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
vim.keymap.set("n", "gr", builtin.lsp_references, {})
