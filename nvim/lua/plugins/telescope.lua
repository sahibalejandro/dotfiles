-- Wrap telescope functions to avoid loading Telescope
-- during startup and make this plugin real lazy
function resume()
  require'telescope.builtin'.resume()
end

function old_files()
  require'telescope.builtin'.oldfiles()
end

function live_grep()
  require'telescope.builtin'.live_grep()
end

function find_files()
  require'telescope.builtin'.find_files()
end

function grep_string()
  require'telescope.builtin'.grep_string()
end

function lsp_references()
  require'telescope.builtin'.lsp_references()
end

function lsp_definitions()
  require'telescope.builtin'.lsp_definitions()
end

return {
  'nvim-telescope/telescope.nvim',

  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,

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
    { '<leader>r', resume  },
    { '<leader>o', old_files },
    { '<leader>s', live_grep },
    { '<leader>f', find_files },
    { '<leader>k', grep_string },
    { '<leader>lr', lsp_references },
    { '<leader>ld', lsp_definitions },
  },
}
