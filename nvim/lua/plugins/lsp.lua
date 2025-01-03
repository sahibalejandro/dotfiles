return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "saghen/blink.cmp",
    },

    opts = {
      servers = {
        ts_ls = {},
        lua_ls = {},
      },
    },

    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local get_lsp_capabilities = require("blink.cmp").get_lsp_capabilities

      for server, config in pairs(opts.servers) do
        config.capabilities = get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "Add mappings for LSP",
        callback = function()
          vim.keymap.set("n", "grn", vim.lsp.buf.rename)
          vim.keymap.set("n", "gra", vim.lsp.buf.code_action)
          vim.keymap.set("n", "grr", vim.lsp.buf.references)
          vim.keymap.set("n", "grf", vim.diagnostic.open_float)
        end
      })
    end
  },

  {
    "saghen/blink.cmp",

    version = "*",

    opts = {
      sources = {
        default = { "lsp" },
        cmdline = {},
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 250,
        },
      },

      signature = { enabled = true }
    },
  },
}
