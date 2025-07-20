vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'

vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = -1

vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', '<space><space>', '<c-^>')

vim.cmd('colorscheme habamax')
