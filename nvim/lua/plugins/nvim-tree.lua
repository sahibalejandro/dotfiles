return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  lazy = false,

  config = function()
    require'nvim-tree'.setup{
      view = {
        number = true,
        side = 'right',
        relativenumber = true,
        width = 45,
      },
    }
  end,

  keys = {
    { '<leader>1', '<cmd>NvimTreeToggle<cr>' },
    { '<leader>2', '<cmd>NvimTreeFindFile<cr>' },
  },
}
