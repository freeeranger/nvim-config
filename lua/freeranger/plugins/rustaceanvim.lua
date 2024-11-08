vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
        float_win_config = {
            border = "rounded",
        },
    },

    -- LSP configuration
    server = {},

    -- DAP configuration
    dap = {},
}

local function on_attach(client, bufnr)
    -- TODO more keybinds + add these to whichkey
    vim.keymap.set("n", "<leader>ca", ":RustLsp codeAction<CR>")
    vim.keymap.set("n", "<leader>cc", ":RustLsp openCargo<CR>")
end

local function on_detach(client, bufnr)
    -- TODO disable the keymaps here
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.name == "rust-analyzer" then
            on_attach(client, args.buf)
        end
    end,
})

vim.api.nvim_create_autocmd("LspDetach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.name == "rust-analyzer" then
            on_detach(client, args.buf)
        end
    end,
})
