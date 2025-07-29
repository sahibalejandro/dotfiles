return {
  'mfussenegger/nvim-lint',
  dependencies = { 'neovim/nvim-lspconfig' },
  config = function(lint)
    local lint = require('lint')

    lint.linters_by_ft = {
      php = {'phpcs'}
    }

    vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufReadPost' }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
