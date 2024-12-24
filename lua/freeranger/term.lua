-- Term mode specific config
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("term-open", { clear = true }),
    callback = function()
        -- Options
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})

-- Keybinds
vim.keymap.set("t", "<C-w>n", "<Esc><C-\\><C-n><CR>")       -- Normal mode
vim.keymap.set("t", "<C-w>q", "<Esc><C-\\><C-n><CR>:q<CR>") -- Close
