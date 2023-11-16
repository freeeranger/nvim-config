vim.opt.timeout = true
vim.opt.timeoutlen = 300

local which_key = require("which-key")

which_key.setup()

which_key.register({
    p = {
        name = "Project",
        f = { "Open telescope" },
        v = { "File explorer"},
        s = { "Grep for string" },
    },
    f = {
        name = "File",
        d = { "set cwd to files directory" }
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
            a = {"Add, commit and push everything"}
        }
    },
    o = {
        name = "Open",
        t = { "Terminal" },
        c = { "Config directory" },
        e = { "Trouble" },
        l = { "Lazy" },
        m = { "Mason" },
        u = { "Undo tree" },
    }
}, { prefix = "<leader>" })
