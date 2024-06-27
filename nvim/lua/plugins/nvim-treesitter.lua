return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',

  config = function()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
      sync_install = true,

      ensure_installed = {
        'lua',
        'tsx',
        'javascript',
        'typescript',
      },

      highlight = {
        enable = true,
      },
    })
  end
}
