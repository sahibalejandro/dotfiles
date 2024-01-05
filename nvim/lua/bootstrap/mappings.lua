vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<leader><leader>", ":b#<cr>")

-- Change windows width
vim.keymap.set("n", "<right>", ":vert res +10<cr>")
vim.keymap.set("n", "<left>", ":vert res -10<cr>")

-- Sort visual selected lines by length
vim.keymap.set("v", "<leader>s", ":!awk '{ print length(), $0 | \"sort -n | cut -d\\\\  -f2-\" }'<cr>")
