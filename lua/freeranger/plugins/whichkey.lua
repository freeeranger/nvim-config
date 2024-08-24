local whichkey = require("which-key")

whichkey.setup({
    preset = "modern",
})

whichkey.add({
    { "<leader>o", group = "Open", icon = { icon = "󰠜", color = "cyan" } },
    { "<leader>of", desc = "Explorer", icon = { icon = "󰙅", color = "cyan" } },
    { "<leader>ol", desc = "Lazy", icon = { icon = "", color = "cyan" } },
    { "<leader>om", desc = "Mason", icon = { icon = "", color = "cyan" } },
    { "<leader>oi", desc = "Lsp Info", icon = { icon = "", color = "cyan" } },
    { "<leader>oc", desc = "Config dir", icon = { icon = "", color = "cyan" } },

    { "<leader>b", group = "Buffer" },
    { "<leader>bs", desc = "Source" },
    { "<leader>bf", desc = "Format" },
    { "<leader>bd", desc = "Set cwd" },
    { "<leader>bt", desc = "Trim whitespace", icon = { icon = "", color = "cyan" } },
    { "<leader>bx", desc = "Close", icon = { icon = "", color = "cyan" } },

    { "<leader>c", group = "Code", icon = { icon = "󰅨", color = "cyan" } },
    { "<leader>ca", desc = "Actions", icon = { icon = "", color = "cyan" } },
    { "<leader>cr", group = "Refactor", icon = { icon = "󰘦", color = "cyan" } },
    { "<leader>crr", desc = "Rename", icon = { icon = "󰑕", color = "cyan" } },

    { "<leader>d", desc = "Delete", icon = { icon = "", color = "cyan" } },
    { "<leader>y", desc = "Yank selection to clipboard", icon = { icon = "", color = "cyan" } },
    { "<leader>Y", desc = "Yank line to clipboard", icon = { icon = "", color = "cyan" } },

    { "<leader>p", desc = "Paste after cursor from clipboard", icon = { icon = "", color = "cyan" } },
    { "<leader>P", desc = "Paste before cursor from clipboard", icon = { icon = "", color = "cyan" } },

    { "<leader>s", desc = "Replace all occurences", icon = { icon = "󰛔", color = "cyan" } },
    { "<leader>r", desc = "Replace selection with register", icon = { icon = "󰛔", color = "cyan" } },

    { "<leader>.", desc = "Find files", icon = { icon = "󰮗", color = "cyan" } },
    { "<leader>l", desc = "Last buffer", icon = { icon = "󰓩", color = "cyan" } },
})
