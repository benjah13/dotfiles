vim.cmd "autocmd!"

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true
vim.wo.relativenumber = true

vim.g.mapleader = " "

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = false

vim.opt.showmode = false

vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "zsh"
vim.opt.backupskip = "/tmp/*./private/tmp/*"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true -- auto indent
vim.opt.si = true -- smart indent
vim.opt.wrap = false -- no wrap lines
vim.opt.backspace = "start,eol,indent"
vim.opt.path:append { "**" } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { "*/node_modules/*" }

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

vim.opt.formatoptions:append { "r" }

vim.lsp.set_log_level('debug')
