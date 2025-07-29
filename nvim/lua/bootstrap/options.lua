vim.g.mapleader = ' '
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = -1
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', '<leader><leader>', '<c-^>')

vim.cmd('colorscheme habamax')
vim.cmd('highlight Normal guibg=None')
