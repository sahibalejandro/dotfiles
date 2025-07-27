vim.o.grepprg = 'rg --vimgrep'

vim.api.nvim_create_user_command('S', function(opts)
  vim.cmd('sil gr '..opts.args..'|copen')
end, { nargs = 1, desc = 'Search using grep' })
