vim.cmd("set nu rnu")
vim.cmd("set tabstop=2")
vim.cmd("set ai")
vim.cmd("syntax on")
vim.cmd("set shiftwidth=4")
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
local plugins = {
	{
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
		{
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
	{"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},

},

}


require("lazy").setup(plugins, opts)


local builtin = require("telescope.builtin")
vim.keymap.set('n','<C-p>', builtin.find_files, {})
vim.keymap.set('n','<leader>fg', builtin.live_grep, {})

local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"lua", "python", "julia", "c"},
	highlight = { enable = true },
	indent = { enable = true },
})
