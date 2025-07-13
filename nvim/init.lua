vim.o.number = true
vim.o.relativenumber = true
vim.o.laststatus = 0
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = -1

vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', '<space><space>', ':b#<cr>')

--
-- Find text using ripgrep
--
vim.o.grepprg = "rg --vimgrep"
vim.api.nvim_create_user_command(
  'S',
  function (opts)
    vim.cmd('sil gr "' .. opts.args .. '" | copen')
  end,
  {
    nargs = 1,
    desc = 'Fire grep and show results in quickfix'
  }
)
vim.keymap.set('n', '<space>s', ':S ')

--
-- Find files using FZF
--
vim.keymap.set('n', '<space>ff', function()
  local tmp_file = vim.fn.tempname()

  vim.api.nvim_create_autocmd('TermClose', {
    once = true,
    callback = function()
      local ok, lines = pcall(vim.fn.readfile, tmp_file)
      vim.cmd('bd')

      if ok and #lines > 0 then
	vim.cmd('e ' .. lines[1])
	vim.cmd('filetype detect')
      end

      vim.loop.fs_unlink(tmp_file)
    end
  })

  vim.cmd('terminal fzf > ' .. tmp_file)
  vim.cmd('startinsert')
end)
