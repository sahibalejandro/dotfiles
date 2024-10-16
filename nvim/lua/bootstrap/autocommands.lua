vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = {"*.php"},
  command = "set syntax=php",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {"php"},
  command = "setlocal shiftwidth=4 tabstop=4",
})
