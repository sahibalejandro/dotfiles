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
vim.o.winborder = 'rounded'
vim.g.netrw_banner = false

vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', '<leader><leader>', '<c-^>')
vim.keymap.set('n', '<leader>e', '<cmd>Ex<cr>')

vim.cmd('highlight Normal guibg=None')
