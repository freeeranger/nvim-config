-- Term mode specific config
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("term-open", { clear = true }),
    callback = function()
        -- Options
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})

-- Keymaps
vim.keymap.set("n", "<leader>ts", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 11)
    vim.cmd("startinsert")
end)

vim.keymap.set("n", "<leader>tf", function()
    vim.cmd.enew()
    vim.cmd.term()
    vim.cmd("startinsert")
end)

vim.keymap.set("t", "<C-w>n", "<Esc><C-\\><C-n><CR>")
vim.keymap.set("t", "<C-w>q", "<Esc><C-\\><C-n><CR>:q<CR>")
