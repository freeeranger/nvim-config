vim.g.lsp_zero_extend_cmp = 0
vim.g.lsp_zero_extend_lspconfig = 0

local lsp_zero = require("lsp-zero")
lsp_zero.extend_cmp()

local cmp = require("cmp")
local types = require("cmp.types")

local cmp_action = lsp_zero.cmp_action()
local cmp_select = { behavior = types.cmp.SelectBehavior.Select }

local lspkind = require("lspkind")

cmp.setup({
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = lspkind.cmp_format({
            mode = 'text_symbol',
            preset = 'codicons',
            maxwidth = 50,
            ellipsis_char = '...',
            show_labelDetails = true,
        })
    },
    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered({
            winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
        }),
    },
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

            if cmp.visible() then
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
    enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
        end
    end
})

lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

local mason = require("mason")
mason.setup({
    ui = {
        border = "rounded",
        width = 0.8,
        height = 0.8
    }
})

local mason_lspconf = require("mason-lspconfig")

mason_lspconf.setup({
    ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "tsserver",
        "tailwindcss",
        "basedpyright",
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
        rust_analyzer = function() end,
    },
})

require('lspconfig.ui.windows').default_options.border = 'rounded' -- :LspInfo rounded border
