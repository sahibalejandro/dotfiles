vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.wrap = false
vim.o.swapfile = false

vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = -1

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

vim.o.grepprg = 'rg --vimgrep'

vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', '<space><space>', '<c-^>')

vim.api.nvim_create_user_command('S', function(opts)
  vim.cmd('sil gr '..opts.args..'|copen')
end, { nargs = 1, desc = 'Search using grep' })

vim.cmd('colorscheme habamax')
vim.cmd('set completeopt+=menuone,noinsert,fuzzy')
