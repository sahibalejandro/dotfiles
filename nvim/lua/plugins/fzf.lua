local fzf_opts_preview_hidden = { winopts = { preview = { hidden = false } } }

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
        require('fzf-lua').live_grep(fzf_opts_preview_hidden)
      end,
      desc = 'Search pattern using ripgrep and fzf' 
    },
    {
      '<leader>k',
      function()
        require('fzf-lua').grep_cword(fzf_opts_preview_hidden)
      end,
      desc = 'Search word under the cursor' 
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
    oldfiles = {
      cwd_only = true,
    },
  },
}
