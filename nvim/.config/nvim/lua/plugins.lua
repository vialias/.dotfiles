return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "ruff", "pylsp", "bashls", "texlab"}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.ruff.setup({})
			lspconfig.pylsp.setup({})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', 'K', vim.diagnostic.open_float, {}) -- fehler und warnings darstellen
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup({
				options = {
					theme = 'pywal-nvim',
				}
			})
		end
	},
	{
		'echasnovski/mini.nvim', 
		version = false,
		config = function()
			require('mini.surround').setup()
		end	
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", 
			"MunifTanjim/nui.nvim",
		},
		lazy = false,
		opts = {
			hide_dotfiles = false,
		  hide_gitignored = true,
		},
		config = function()
			vim.keymap.set('n', '<C-n>', ':Neotree toggle left<CR>', {})
		end
	},
	{
		'AlphaTechnolog/pywal.nvim',
		config = function()
			local pywal = require('pywal')
			pywal.setup()
		end
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim'},
		config = function ()
			local builtin = require("telescope.builtin")
			vim.keymap.set('n','<C-p>', builtin.find_files, {})
			vim.keymap.set('n','<leader>fg', builtin.live_grep, {})
		end
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
		{ "<c-\">", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	  },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master', lazy = false,
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = {"lua", "python", "c"},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end

	},
	{
		'goolord/alpha-nvim',
		dependencies = { 'echasnovski/mini.icons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	}
}
