--
-- Find files using FZF
--
vim.keymap.set('n', '<space>ff', function()
  local tmp_file = vim.fn.tempname()

  vim.api.nvim_create_autocmd('TermClose', {
    once = true,
    callback = function()
      local ok, lines = pcall(vim.fn.readfile, tmp_file)
      vim.loop.fs_unlink(tmp_file)
      vim.cmd('bd')

      if ok and #lines > 0 then
	vim.cmd('e ' .. lines[1])
	vim.cmd('filetype detect')
      end

    end
  })

  vim.cmd('terminal fzf > ' .. tmp_file)
  vim.cmd('startinsert')
end)
