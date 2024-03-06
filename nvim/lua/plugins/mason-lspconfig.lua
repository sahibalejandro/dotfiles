return {
  'williamboman/mason-lspconfig.nvim',

  dependencies = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'b0o/schemastore.nvim',
  },

  config = function()
    require('mason-lspconfig').setup()

    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    --
    -- Rust
    --
    lspconfig.rust_analyzer.setup({})

    --
    -- PHP
    --
    lspconfig.intelephense.setup({
      capabilities = capabilities,
    })

    --
    -- TailwindCSS
    --
    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    --
    -- Flow
    --
    lspconfig.flow.setup({
      capabilities = capabilities,
      -- Only "flow" filetype should use this language server.
      filetypes = { 'flow' },
    })

    --
    -- JSON Schemas
    --
    lspconfig.jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          validate = { enable = true },
          schemas = require('schemastore').json.schemas(),
        },
      },
    })

    --
    -- TypeScript
    --
    lspconfig.tsserver.setup({
      capabilities = capabilities,
      -- Disable single_file_support to ensure this server is attached
      -- only with a matching root directory.
      single_file_support = false,

      -- Look for the Flow and TS root directories and do not attach
      -- tsserver if a Flow root directory is found. The root_pattern
      -- for tsserver is a copy from:
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
      root_dir = function(filename)
        local flowRootDir = lspconfig.util.root_pattern('.flowconfig')(filename)
        local tsRootDir = lspconfig.util.root_pattern('tsconfig.json', 'package.json', 'jsconfig.json', '.git')(filename)

        if flowRootDir == nil then
          return tsRootDir
        end

        return nil
      end
    })

    --
    -- Diagnostic Configurations
    --
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        source = true,
      },
    })

    --
    -- LSP keymaps
    --
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(event)
        local options = { buffer = event.buf }
        vim.keymap.set('n', '<leader>lo', vim.diagnostic.open_float, options)
        vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, options)
        vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, options)
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, options)
        vim.keymap.set('n', '<leader>li', vim.lsp.buf.hover, options)
      end,
    })
  end,
}
