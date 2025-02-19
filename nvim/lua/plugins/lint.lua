return {
  'mfussenegger/nvim-lint',

  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      scss = {'stylelint'}
    }

    vim.api.nvim_create_autocmd({ 'BufReadPost', 'InsertLeave' }, {
      callback = function()
        lint.try_lint()
      end
    })
  end
}
