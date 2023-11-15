-- Disable automatic setup, we are doing it manually
vim.g.lsp_zero_extend_cmp = 0
vim.g.lsp_zero_extend_lspconfig = 0

-- Here is where you configure the autocompletion settings.
local lsp_zero = require('lsp-zero')
lsp_zero.extend_cmp()

-- And you can configure cmp even more, if you want to.
local cmp = require('cmp')
local types = require('cmp.types')

local cmp_action = lsp_zero.cmp_action()
local cmp_select = { behavior = types.cmp.SelectBehavior.Select }

cmp.setup({
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<Tab>'] = cmp.mapping.confirm({select = true}),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-e>'] = cmp.mapping.abort()
    })
})

local neodev = require("neodev")
neodev.setup({})

-- This is where all the LSP shenanigans will live
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

local mason_lspconf = require('mason-lspconfig')

mason_lspconf.setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            -- local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace"
                        },
                        telemetry = {
                            enable = false
                        },
                        diagnostics = {
                            disable = { "missing-fields" }
                        }
                    }
                }
            })
        end,
    }
})

