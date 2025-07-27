vim.lsp.config('intelephense', {
  cmd = { vim.fn.getenv('HOME') .. '/.config/nvim/lsp/node_modules/.bin/intelephense', '--stdio' },
  root_markers = { '.git', 'composer.json' },
  filetypes = { 'php' },
})
