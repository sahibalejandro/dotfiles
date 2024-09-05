return {
  'neovim/nvim-lspconfig',
  priority = 600,

  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },

  config = function()
    local lsp = require'lspconfig'
    local capabilities = require'cmp_nvim_lsp'.default_capabilities()

    local mason_packages_path = vim.fn.stdpath'data' .. '/mason/packages'
    local volar_location = mason_packages_path .. '/vue-language-server/node_modules/@vue/language-server'
    local typescript_location = mason_packages_path .. '/typescript-language-server/node_modules/typescript/lib'

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

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        vim.keymap.set('n', '<leader>li', vim.lsp.buf.hover)
        vim.keymap.set('n', '<leader>lR', vim.lsp.buf.rename)
        vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition)
        vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
        vim.keymap.set('n', '<leader>ln', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<leader>lp', vim.diagnostic.goto_prev)
        vim.keymap.set('n', '<leader>lo', vim.diagnostic.open_float)
      end,
    })
  end,
}
