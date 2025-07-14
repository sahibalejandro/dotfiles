return {
  cmd = { './node_modules/.bin/typescript-language-server', '--stdio' },
  root_markers = { 'tsconfig.json', 'package.json', '.git' },
  filetypes = { 'typescript', 'javascript' }
}
