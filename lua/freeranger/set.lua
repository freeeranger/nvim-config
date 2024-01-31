vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.sidescroll = 1

vim.opt.updatetime = 50

vim.g.mapleader = " "

-- vim.cmd("language en_US")

vim.opt.smartindent = true
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true

vim.fn.sign_define("DiagnosticSignError", { text = '', texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = '', texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = '', texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = '', texthl = "DiagnosticSignHint" })
