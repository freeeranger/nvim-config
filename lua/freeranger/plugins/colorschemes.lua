return {
    "catppuccin/nvim",
    opts = {
        flavour = "mocha",
        no_italic = true,
        transparent_background = false,
        color_overrides = {
            mocha = {
                base = "#1e1e1f",
                mantle = "#232324",
                surface0 = "#272728",
            }
        }
    },
    lazy = false,
    priority = 1000,
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end
}
