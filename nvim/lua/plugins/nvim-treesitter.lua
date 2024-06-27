return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',

  config = function()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
      sync_install = true,

      ensure_installed = {
        'lua',
      },

      highlight = {
        enable = true,
      },
    })
  end
}
