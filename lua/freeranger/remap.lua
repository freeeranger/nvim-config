vim.g.mapleader = " "

-- Open netrw
vim.keymap.set("n", "<leader>of", vim.cmd.Ex)

-- Haram remap
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Move selection
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Buffer actions
vim.keymap.set("n", "<C-j>", ":bprevious<CR>")
vim.keymap.set("n", "<C-k>", ":bnext<CR>")
vim.keymap.set("n", "<leader>bx", ":bdelete<CR>")

-- Git
vim.keymap.set("n", "<leader>gw", ":Git<CR>")
vim.keymap.set("n", "<leader>gs", ":G status<CR>")
vim.keymap.set("n", "<leader>gA", ":G add .<CR>")
vim.keymap.set("n", "<leader>ga", ":G add %:p<CR>")
vim.keymap.set("n", "<leader>gR", ":G reset .<CR>")
vim.keymap.set("n", "<leader>gr", ":G reset %:p<CR>")
vim.keymap.set("n", "<leader>gp", ":G push<CR>")
vim.keymap.set("n", "<leader>gl", ":G pull<CR>")
vim.keymap.set("n", "<leader>gi", ":G init")

vim.keymap.set("n", "<leader>gc", function()
    local message = vim.fn.input("Commit message: ")
    vim.cmd(string.format(":G commit -m '%s'", message))
end)

vim.keymap.set("n", "<leader>gxa", function()
    local message = vim.fn.input("Commit message: ")
    vim.cmd(string.format(":G add . | :G commit -q -m '%s' | :G push -q", message))
    print("Staged, committed and pushed all changes")
end)

vim.keymap.set("n", "<leader>gxi", function()
    local message = vim.fn.input("Repo url: ")
    print(
        string.format(
            ":G init | :G add . | :G commit -q -m 'Initial commit' | git remote add origin %s | git branch -M main | :G push -q -u origin main",
            message
        )
    )
    print("Repo successfully set up")
end)

-- Open
vim.keymap.set("n", "<leader>oe", ":TroubleToggle<CR>")
vim.keymap.set("n", "<leader>ol", ":Lazy<CR>")
vim.keymap.set("n", "<leader>om", ":Mason<CR>")
vim.keymap.set("n", "<leader>ou", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>oa", ":Alpha<CR>")
vim.keymap.set("n", "<leader>oi", ":LspInfo<CR>")
vim.keymap.set("n", "<leader>oc", function() -- Open config dir
    local config_dir = vim.fn.stdpath("config")
    vim.cmd(":e " .. config_dir .. "/init.lua")
    vim.cmd(":cd %:p:h")
end)

-- Buffer
vim.keymap.set("n", "<leader>bn", ":enew<CR>")
vim.keymap.set("n", "<leader>bo", ":e ")
vim.keymap.set("n", "<leader>bd", ":cd %:p:h<CR>") -- set neovim cwd to current files directory
vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>bu", ":w<CR> :!dos2unix %<CR><CR>")

-- Code
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
