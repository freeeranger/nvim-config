return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        spelling = {
            enabled = false
        },
        sort = {"manual"}
    },
    keys = {},
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.add({
            -- Top level
            {"<leader>,", desc = "Oil", icon = { icon = "", color = "orange"}},
            {"<leader>l", desc = "Last buffer", icon = { icon = "", color = "orange"}},
            {"<leader>x", desc = "Close buffer", icon = { icon = "", color = "orange"}},
            {"<leader>y", desc = "Yank to system", icon = { icon = "", color = "orang"}},
            {"<leader>Y", desc = "Yank line to system", icon = { icon = "", color = "orange"}},
            {"<leader>p", desc = "Paste from system", icon = { icon = "", color = "orange"}},
            {"<leader>P", desc = "Paste line from system", icon = { icon = "", color = "orange"}},

            -- Buffer
            {"<leader>b", group = "Buffer", icon = { icon = "", color = "orange"}},
            {"<leader>bs", desc = "Source buffer", icon = { icon = "", color = "orange"}},
            {"<leader>bt", desc = "Trim whitespace", icon = { icon = "", color = "orange"}},
            {"<leader>bd", desc = "Set cwd to buffer dir", icon = { icon = "", color = "orange"}},

            -- Open
            {"<leader>o", group = "Open", icon = { icon = "", color = "orange"}},
            {"<leader>oc", desc = "Config", icon = { icon = "", color = "orange"}},
            {"<leader>ol", desc = "Lazy", icon = { icon = "󰒲", color = "orange"}},
            {"<leader>om", desc = "Mason", icon = { icon = "", color = "orange"}},

            -- Code
            {"<leader>c", group = "Code", icon = { icon = "", color = "orange"}},
            {"<leader>ca", desc = "Action", icon = { icon = "", color = "orange"}},
            {"<leader>cf", desc = "Format", icon = { icon = "", color = "orange"}},
        })
    end
}
