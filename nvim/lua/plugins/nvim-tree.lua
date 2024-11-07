return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = true,

  config = function()
    vim.cmd([[hi NvimTreeNormal guibg=NONE]])
    vim.cmd([[hi NvimTreeNormalNC guibg=NONE]])

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
