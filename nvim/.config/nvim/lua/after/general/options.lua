vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.timeoutlen = 100
vim.opt.updatetime = 500

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.hidden = true

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2

vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.pumheight = 10
vim.opt.completeopt = {}

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.list = true
vim.opt.listchars:append("trail:·")
vim.opt.iskeyword:append("-")

local gOptions = vim.api.nvim_create_augroup("Options", {})
vim.api.nvim_create_autocmd("BufEnter", {
  group = gOptions,
  command = "set formatoptions-=cro",
})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = gOptions,
  callback = function() vim.highlight.on_yank({ higroup = "Visual", on_visual = false }) end,
})
