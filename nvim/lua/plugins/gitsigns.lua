return {
  'lewis6991/gitsigns.nvim',
  config = function()
    local gitsigns = require('gitsigns')
    gitsigns.setup({
      current_line_blame_formatter = '<abbrev_sha> <author> <author_time:%R> - <summary>',
    })

    vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame)
    vim.keymap.set('n', '<leader>gn', gitsigns.next_hunk)
    vim.keymap.set('n', '<leader>gp', gitsigns.prev_hunk)
  end
}
