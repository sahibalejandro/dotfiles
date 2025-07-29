vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', '<leader><leader>', '<c-^>')
vim.keymap.set('n', '<leader>e', ':Ex<cr>')

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  callback = function(ev)
    vim.keymap.set('n', '<esc>', ':bwipeout<cr>', { buffer = true })
  end,
})
