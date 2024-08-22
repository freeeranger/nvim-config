require("catppuccin").setup({
    flavour = "mocha",
    no_italic = true,
    transparent_background = false,
    color_overrides = {
        mocha = {
            base = "#161617",
            mantle = "#191919",
            surface0 = "#262626",
        }
    }
})

vim.cmd.colorscheme("catppuccin")
