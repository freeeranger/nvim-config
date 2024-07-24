-- Move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move current line
vim.keymap.set("n", "<A-j>", ":m .-2<CR>==")
vim.keymap.set("n", "ª", ":m .-2<CR>==") -- Same as above but on my macbook keyboard

vim.keymap.set("n", "<A-k>", ":m .+1<CR>==")
vim.keymap.set("n", "√", ":m .+1<CR>==") -- Same as above but on my macbook keyboard

-- Center screen after certain actions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>r", [["_dP]])         -- Replace selected text with register
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- Delete selection without saving to register

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

-- Buffer navigation
vim.keymap.set("n", "<C-j>", ":bprevious<CR>")
vim.keymap.set("n", "<C-k>", ":bnext<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Replace all occurences

vim.keymap.set("n", "Q", "<nop>")

-- Buffer
vim.keymap.set("n", "<leader>bs", ":so %<CR>")     -- Source current buffer
vim.keymap.set("n", "<leader>bd", ":cd %:p:h<CR>") -- Set cwd to current file dir
vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>bt", function()       -- Trim whitespace
    if not vim.o.binary and vim.o.filetype ~= 'diff' then
        local current_view = vim.fn.winsaveview()
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.fn.winrestview(current_view)
    end
end)
vim.keymap.set("n", "<leader>bx", ":bdelete<CR>")

-- Open
vim.keymap.set("n", "<leader>of", ":Oil<CR>")
vim.keymap.set("n", "<leader>ol", ":Lazy<CR>")
vim.keymap.set("n", "<leader>om", ":Mason<CR>")
vim.keymap.set("n", "<leader>oi", ":LspInfo<CR>")
vim.keymap.set("n", "<leader>oc", function() -- Open config dir
    local config_dir = vim.fn.stdpath("config")
    vim.cmd(":e " .. config_dir .. "/init.lua")
    vim.cmd(":cd %:p:h")
end)

-- Code
vim.keymap.set("n", "<leader>crr", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
