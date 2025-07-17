vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = -1
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.wrap = false
vim.o.swapfile = false
vim.o.winborder = 'single'

vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', '<space><space>', '<c-^>')
vim.keymap.set('n', '<space>n', ':cn<cr>')
vim.keymap.set('n', '<space>p', ':cp<cr>')

vim.cmd [[colorscheme retrobox]]
vim.cmd [[set completeopt+=menuone,noinsert,fuzzy]]
