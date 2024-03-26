return {
  'michaelrommel/nvim-silicon',
  lazy = true,
  cmd = 'Silicon',
  config = function()
    require('silicon').setup({
      font = 'SFMono Nerd Font Mono=15',
      background = '#fefefe',
      pad_horiz = 20,
      pad_vert = 20,
      line_pad = 10,
      tab_width = 4,
    })
  end
}
