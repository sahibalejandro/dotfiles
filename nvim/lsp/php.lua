vim.lsp.config('php', {
  cmd = { vim.fn.getenv('HOME') .. '/.config/nvim/lsp/node_modules/.bin/intelephense', '--stdio' },
  root_markers = { 'composer.json', '.git' },
  filetypes = { 'php' }
})
