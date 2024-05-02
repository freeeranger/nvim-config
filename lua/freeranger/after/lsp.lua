-- Disable automatic setup, we are doing it manually
vim.g.lsp_zero_extend_cmp = 0
vim.g.lsp_zero_extend_lspconfig = 0

-- Here is where you configure the autocompletion settings.
local lsp_zero = require("lsp-zero")
lsp_zero.extend_cmp()

-- And you can configure cmp even more, if you want to.
local cmp = require("cmp")
local types = require("cmp.types")

local copilot = require("copilot.suggestion")

local cmp_action = lsp_zero.cmp_action()
local cmp_select = { behavior = types.cmp.SelectBehavior.Select }

cmp.setup({
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			local function has_words_before()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			if copilot.is_visible() then
				copilot.accept()
			elseif cmp.visible() then
				cmp.select_next_item()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-e>"] = cmp.mapping.abort(),
	}),
})

local neodev = require("neodev")
neodev.setup({})

lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

local mason_lspconf = require("mason-lspconfig")

mason_lspconf.setup({
	ensure_installed = {
		"lua_ls",
		"html",
		"cssls",
		"tsserver",
		"tailwindcss",
		"pyright",
		"gopls",
	},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						telemetry = {
							enable = false,
						},
						diagnostics = {
							disable = { "missing-fields" },
						},
					},
				},
			})
		end,
	},
})

-- Setting a different port for gdscript lsp since localhost doesn't work through wsl
require("lspconfig").gdscript.setup({
	cmd = { "nc", "172.19.112.1", "6005" },
})
