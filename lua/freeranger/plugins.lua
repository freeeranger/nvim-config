local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        build = ":TSUpdate",
    },
    { "mbbill/undotree" },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        --config = false,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {"L3MON4D3/LuaSnip"},
        },
    },
    {
        "folke/neodev.nvim",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        cmd = {"LspInfo", "LspInstall", "LspStart"},
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {
            {"hrsh7th/cmp-nvim-lsp"},
            {"williamboman/mason-lspconfig.nvim"},
        },
    },
    { "folke/which-key.nvim" },
    { "tpope/vim-fugitive" },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter"
    },
    { "numToStr/Comment.nvim" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "akinsho/toggleterm.nvim", config = true },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    }
})
