return {
  'neovim/nvim-lspconfig',
  priority = 600,

  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },

  config = function()
    local lsp = require'lspconfig'
    local capabilities = require'cmp_nvim_lsp'.default_capabilities()

    -- LSP Server for Vue
    -- Configuration for TypeScript:
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
    lsp.volar.setup{
      -- Since the tsserver is used to extend Volar the "capabilities"
      -- property does not need to be added here. Doing it will cause
      -- duplicated entries in the auto-complete options.
    }

    -- LSP Server for TypeScript and JavaScript
    lsp.tsserver.setup{
      capabilities = capabilities,

      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = '',
            languages = { 'javascript', 'typescript', 'vue' }
          },
        },
      },
      filetypes = { 'javascript', 'typescript', 'vue' }
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
