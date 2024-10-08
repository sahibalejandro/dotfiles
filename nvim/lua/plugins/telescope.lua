return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    require'telescope'.setup{
      defaults = {
        layout_strategy = 'vertical',
        layout_config = {
          width = 0.9,
          preview_cutoff = 30,
          preview_height = 0.6,
        },
      },
    }
  end,

  keys = {
    { '<leader>r', require'telescope.builtin'.resume },
    { '<leader>o', require'telescope.builtin'.oldfiles },
    { '<leader>s', require'telescope.builtin'.live_grep },
    { '<leader>f', require'telescope.builtin'.find_files },
    { '<leader>k', require'telescope.builtin'.grep_string },
    { '<leader>lr', require'telescope.builtin'.lsp_references },
    { '<leader>ld', require'telescope.builtin'.lsp_definitions },
  },
}
