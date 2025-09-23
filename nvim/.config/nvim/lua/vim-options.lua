-- Key-remaps
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Colorscheme
vim.cmd.colorscheme("default")

-- Basis settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true -- Highlights current line 
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true

-- Indentation
vim.opt.tabstop = 2  -- Tab width
vim.opt.shiftwidth = 2 -- Indent width
vim.opt.softtabstop = 2 -- Soft tab stop
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current line

vim.cmd("syntax on")
vim.cmd("set shiftwidth=2")
vim.cmd("set path+=**")
vim.cmd("set ls=2")

