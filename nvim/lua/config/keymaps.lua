vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', '<space><space>', '<c-^>')
vim.keymap.set('n', '<space>e', ':Ex<cr>')

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  callback = function(ev)
    vim.keymap.set('n', '<esc>', ':bwipeout<cr>', { buffer = true })
  end,
})
