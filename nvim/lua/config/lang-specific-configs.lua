-- Use auto commands to set language specific options.
-- You can add multiple auto commands as needed.

-- Change PHP indentation to 4 spaces.
vim.api.nvim_create_autocmd('BufRead', {
  pattern = '*.php',
  callback = function(ev)
    vim.bo[ev.buf].shiftwidth = 4
  end
})
