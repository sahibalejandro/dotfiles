--
-- Find text using ripgrep
--
vim.o.grepprg = "rg --vimgrep"

vim.api.nvim_create_user_command(
  'Ripgrep',
  function (opts)
    vim.cmd('sil gr "' .. opts.args .. '" | copen')
  end,
  {
    nargs = 1,
    desc = 'Fire grep and show results in quickfix'
  }
)
vim.keymap.set('n', '<space>s', ':Ripgrep ')
