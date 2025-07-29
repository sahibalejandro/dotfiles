return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      '<leader>f',
      '<cmd>FzfLua files<cr>',
      desc = 'Find files using FZF' 
    },
    {
      '<leader>o',
      '<cmd>FzfLua oldfiles<cr>',
      desc = 'Find old files using FZF' 
    },
    {
      '<leader>s',
      function()
        require('fzf-lua').live_grep({ winopts = { preview = { hidden = false } } })
      end,
      desc = 'Search pattern using ripgrep and fzf' 
    },
  },
  opts = {
    winopts = {
      border = 'none',
      fullscreen = true,
      preview = {
        border = 'border-bottom',
        hidden = true,
        title = false,
        layout = 'vertical',
        vertical = 'up:70%',
      },
    },
    fzf_opts = {
      ['--layout'] = false,
    },
  },
}
