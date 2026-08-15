return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
        },
        automatic_enable = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.enable("lua_ls")

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.lua",
        callback = function()
          vim.lsp.buf.format({
            async = false,
            timeout_ms = 1000,
          })
        end,
      })
    end,
  },
}
