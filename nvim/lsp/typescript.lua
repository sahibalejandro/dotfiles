return {
  cmd = { vim.fn.getenv('HOME')..'/code/dotfiles/nvim/lsp/node_modules/.bin/typescript-language-server', '--stdio' },
  root_markers = { 'tsconfig.json', 'package.json', '.git' },
  filetypes = { 'typescript', 'typescriptreact' },
}
