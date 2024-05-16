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
    b = {
        name = "Buffer",
        o = { "Open buffer" },
        n = { "New buffer" },
        f = { "Format buffer" },
        d = { "Set cwd" },
        x = { "Close buffer" },
        u = { "Dos2Unix" }
    },
    c = {
        name = "Code",
        r = { "Rename" },
        a = { "Action" },
        s = { "Grep string" },
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
        u = { "UndoTree" },
        a = { "Alpha" },
        f = { "Netrw" },
        i = { "LspInfo" },
    },
}, { prefix = "<leader>" })
