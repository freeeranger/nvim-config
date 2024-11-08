local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        { "nvim-lua/plenary.nvim" },
        { "nvim-tree/nvim-web-devicons" },
        {
            "nvim-treesitter/nvim-treesitter",
            dependencies = {
                "nvim-treesitter/nvim-treesitter-textobjects",
            },
            build = ":TSUpdate",
        },
        { "folke/which-key.nvim" },
        { "nvim-lualine/lualine.nvim" },
        { "catppuccin/nvim",                     name = "catppuccin", priority = 1000 },
        { "stevearc/oil.nvim",                   config = true },
        { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
        { "norcalli/nvim-colorizer.lua" },
        { "j-hui/fidget.nvim" },
        {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v3.x",
            lazy = true,
        },
        {
            "williamboman/mason.nvim",
            lazy = false,
        },
        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                { "L3MON4D3/LuaSnip" },
            },
        },
        {
            "neovim/nvim-lspconfig",
            cmd = { "LspInfo", "LspInstall", "LspStart" },
            event = { "BufReadPre", "BufNewFile" },
            dependencies = {
                { "hrsh7th/cmp-nvim-lsp" },
                { "williamboman/mason-lspconfig.nvim" },
            },
        },
        { "rafamadriz/friendly-snippets" },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            config = true,
        },
        { "onsails/lspkind.nvim" },
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = true
        },
        { "stevearc/conform.nvim" },
        { "nvim-telescope/telescope.nvim" },
        { "MeanderingProgrammer/render-markdown.nvim", config = true },
        { "smjonas/inc-rename.nvim" },
        {
            "mrcjkb/rustaceanvim",
            version = '^4',
            lazy = false,
        },
        { 'echasnovski/mini.hipatterns', version = false },
        { "windwp/nvim-ts-autotag",      config = true },
        {
            "toppair/peek.nvim",
            event = { "VeryLazy" },
            build = "deno task --quiet build:fast",
        },
    },
    {
        ui = {
            border = "rounded",
            size = {
                width = 0.8,
                height = 0.8,
            },
        },

        checker = {
            enabled = true,
            notify = false,
        },
        change_detection = {
            notify = false,
        },
    }
)
