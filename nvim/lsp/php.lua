return {
  cmd = { vim.fn.getenv('HOME')..'/code/dotfiles/nvim/lsp/node_modules/.bin/intelephense', '--stdio' },
  root_markers = { 'composer.json', '.git' },
  filetypes = { 'php' },
}
