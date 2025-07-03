vim.cmd("set nu rnu")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set ai")
vim.cmd("syntax on")
vim.cmd("set shiftwidth=2")
vim.cmd("set path+=**")
vim.cmd("set ls=2")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim


require("lazy").setup("plugins")



local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"lua", "python", "julia", "c"},
	highlight = { enable = true },
	indent = { enable = true },
})

vim.keymap.set('n', '<C-n>', ':Neotree toggle left<CR>', {})
