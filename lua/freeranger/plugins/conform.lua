local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        vue = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
        xml = { "xmlformatter" },
    },
    format_on_save = {
        timeout_ns = 500,
        lsp_fallback = true,
    },
})
