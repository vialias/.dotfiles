return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require("lspconfig")

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "ruff", "pylsp", "bashls", "texlab" },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({ capabilities = capabilities })
          end,
          pylsp = function()
            lspconfig.pylsp.setup({
              capabilities = capabilities,
              settings = {
                pylsp = {
                  plugins = {
                    pycodestyle = { enabled = false },
                    pyflakes = { enabled = false },
                    mccabe = { enabled = false },
                  },
                },
              },
            })
          end,
        },
      })

      -- Global handlers and keymaps
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded"
      })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded"
      })

      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP Definition" })
      vim.keymap.set('n', 'K', vim.diagnostic.open_float, { desc = "LSP Diagnostics" })
    end
  },
}