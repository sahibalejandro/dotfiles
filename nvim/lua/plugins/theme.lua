return {
  "craftzdog/solarized-osaka.nvim",

  lazy = false,
  priority = 1000,

  config = function()
    require'solarized-osaka';
    vim.cmd[[colorscheme solarized-osaka]]
  end,
}
