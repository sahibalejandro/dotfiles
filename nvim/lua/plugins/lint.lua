return {
  'mfussenegger/nvim-lint',

  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      php = { 'phpcs' },
      scss = { 'stylelint' },
      javascript = {'eslint_d'},
      typescript = {'eslint_d'},
      typescriptreact = {'eslint_d'},
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
      callback = function()
        lint.try_lint()
      end
    })
  end
}
