vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selection
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- set neovim cwd to current files directory
vim.keymap.set("n", "<leader>fd", ":cd %:p:h<CR>")

-- git keymaps
vim.keymap.set("n", "<leader>gw", ":Git<CR>")
vim.keymap.set("n", "<leader>gs", ":G status<CR>")
vim.keymap.set("n", "<leader>gA", ":G add .<CR>")
vim.keymap.set("n", "<leader>ga", ":G add %:p<CR>")
vim.keymap.set("n", "<leader>gR", ":G reset .<CR>")
vim.keymap.set("n", "<leader>gr", ":G reset %:p<CR>")
vim.keymap.set("n", "<leader>gp", ":G push<CR>")
vim.keymap.set("n", "<leader>gl", ":G pull<CR>")

vim.keymap.set("n", "<leader>gc", function ()
    local message = vim.fn.input("Commit message: ")
    vim.cmd(string.format(":G commit -m '%s'", message))
end)

vim.keymap.set("n", "<leader>gxa", function ()
    local message = vim.fn.input("Commit message: ")
    vim.cmd(string.format(":G add . | :G commit -m '%s' | :G push", message))
end)

-- Open config
vim.keymap.set("n", "<leader>pc", function ()
    local config_dir = vim.fn.stdpath("config")
    vim.cmd(":e " .. config_dir .. "/init.lua")
    vim.cmd(":cd %:p:h")
end)
