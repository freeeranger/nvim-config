vim.opt.timeout = true
vim.opt.timeoutlen = 300

local which_key = require("which-key")

which_key.setup()

which_key.register({
    p = {
        name = "project",
        f = { "open telescope" },
        v = { "file explorer"},
        s = { "grep for string" },
    },
    u = { "undo-tree" },
    f = {
        name = "file",
        d = { "set cwd to files directory" }
    },
    g = { "vim-fugitive" }
}, { prefix = "<leader>" })
