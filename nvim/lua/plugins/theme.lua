return {
  'catppuccin/nvim',
  lazy = false,
  priority = 1000,

  config = function()
    require'catppuccin'.setup{
      flavour = "mocha",
      transparent_background = true,
      styles = {
        comments = { "italic" },
      },
    }

    vim.cmd[[colorscheme catppuccin]]
  end,
}
