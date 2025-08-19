return {
  'mfussenegger/nvim-lint',
  dependencies = { 'neovim/nvim-lspconfig' },
  config = function(lint)
    local lint = require('lint')

    -- Use better PHP Standards
    local php_standard = vim.fn.getenv('HOME'):find('sjaramillo')
      and 'tests/standards/stable-ruleset.xml'
      or 'PSR12'

    table.insert(
      lint.linters.phpcs.args,
      table.getn(lint.linters.phpcs.args) - 1,
      '--standard='..php_standard
    )

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
