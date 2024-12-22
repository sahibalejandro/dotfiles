return {
  'neovim/nvim-lspconfig',

  lazy = false,
  priority = 900,

  dependencies = {
    'saghen/blink.cmp',
  },

  config = function()
    local lsp = require'lspconfig'
    local capabilities = require'blink.cmp'.get_lsp_capabilities()

    local mason_packages_path = vim.fn.stdpath'data' .. '/mason/packages'
    local volar_location = mason_packages_path .. '/vue-language-server/node_modules/@vue/language-server'
    local typescript_location = mason_packages_path .. '/typescript-language-server/node_modules/typescript/lib'

    local border = "rounded"

    vim.diagnostic.config {
      float = { border = border }
    }

    -- LSP Server for Vue
    --
    -- Configuration notes:
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
    -- https://github.com/williamboman/mason-lspconfig.nvim/issues/371
    lsp.volar.setup{
      capabilities = capabilities,
      init_options = {
        vue = { hybridMode = false },
        typescript = {
          tsdk = typescript_location
        }
      },
    }

    -- LSP Server for TypeScript and JavaScript
    lsp.ts_ls.setup{
      capabilities = capabilities,
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = volar_location,
            languages = { 'vue' }
          },
        },
      },
    }

    -- LSP Server for PHP
    lsp.intelephense.setup{ capabilities = capabilities }

    -- LSP Server for CSS
    lsp.cssls.setup{ capabilities = capabilities }

    -- LSP Server for CSS Modules
    lsp.cssmodules_ls.setup{ capabilities = capabilities }

    -- LSP Server for SASS/SCSS
    lsp.somesass_ls.setup{ capabilities = capabilities }

    -- LSP Server for Tailwind CSS
    lsp.tailwindcss.setup{ capabilities = capabilities }

    -- LSP Server for Rust
    lsp.rust_analyzer.setup{ capabilities = capabilities }
  end,
}
