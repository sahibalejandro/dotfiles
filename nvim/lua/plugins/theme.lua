return {
  "folke/tokyonight.nvim",

  lazy = false,
  priority = 1000,

  config = function()
    require'tokyonight';
    vim.cmd[[colorscheme tokyonight-night]]
  end,
}
