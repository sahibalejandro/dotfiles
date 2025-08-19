return {
  'lewis6991/gitsigns.nvim',
  config = function()
    local gitsigns = require('gitsigns')
    gitsigns.setup()

    vim.keymap.set('n', '<leader>b', gitsigns.toggle_current_line_blame)
  end
}
