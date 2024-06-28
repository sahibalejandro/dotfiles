return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',

  config = function()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
      sync_install = true,

      ensure_installed = {
        'bash',
        'css',
        'dockerfile',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'php',
        'rust',
        'scss',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
        'yaml',
      },

      highlight = {
        enable = true,
      },
    })
  end
}
