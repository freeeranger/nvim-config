-- **MOVEMENT**:
-- move selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move current line up/down
vim.keymap.set("n", "<A-j>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-k>", ":m .+1<CR>==")

-- move current line up/down (macbook)
vim.keymap.set("n", "√", ":m .-2<CR>==")
vim.keymap.set("n", "ª", ":m .+1<CR>==")

-- center screen after some movements
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "N", "Nzzzv")


-- **CLIPBOARD**:
-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- line

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P"]]) -- line


-- **BUFFERS**:
-- buffer navigation
vim.keymap.set("n", "<C-j>", ":bprevious<CR>")
vim.keymap.set("n", "<C-k>", ":bnext<CR>")
vim.keymap.set("n", "<leader>l", "<C-^>") -- last used buffer

-- buffer actions
vim.keymap.set("n", "<leader>x", ":bdelete<CR>")
vim.keymap.set("n", "<leader>bs", ":so %<CR>")      -- source current buffer
vim.keymap.set("n", "<leader>bd", ":cd %:p:h<CR>")  -- set cwd to file's dir
vim.keymap.set("n", "<leader>bt", function()        -- trim trailing whitespace
  if not vim.o.binary and vim.o.filetype ~= 'diff' then
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end
end)

-- **OPEN STUFF**:
vim.keymap.set("n", "<leader>,", ":Oil<CR>")
vim.keymap.set("n", "<leader>ol", ":Lazy<CR>")
vim.keymap.set("n", "<leader>om", ":Mason<CR>")
vim.keymap.set("n", "<leader>oc", function()    -- open config dir
  local config_dir = vim.fn.stdpath("config")
  vim.cmd(":e " .. config_dir)
  vim.cmd(":cd " .. config_dir)
end)


-- **LSP / CODE**:
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)

-- **DISABLED**:
vim.keymap.set("n", "Q", "<nop>")

