return {
  'nvim-lualine/lualine.nvim',

  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function ()
    -- set path = 1 to display the relative path name
    local filename_options = { 'filename', path = 1 }

    require('lualine').setup({
      options = {
        theme = {
          normal = {
            a = { bg = '#02212b', fg = '#8c9c9c' },
            b = { bg = '#02212b', fg = '#455a61' },
            c = { bg = '#02212b', fg = '#455a61' },
          }
        },
        globalstatus = true,
        section_separators = '',
        component_separators = '',
      },

      sections = {
        lualine_a = { filename_options },
        --lualine_b = { 'branch', 'diff' },
        lualine_b = { 'branch' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'diagnostics', 'filetype' },
        lualine_z = { 'progress', 'location' },
      },

      inactive_sections = {
        lualine_c = { filename_options },
      },
    })
  end,
}
