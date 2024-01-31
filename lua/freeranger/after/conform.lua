local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { { "prettierd", "prettier" } },
	},
	format_on_save = {
		timeout_ns = 500,
		lsp_fallback = true,
	},
})
