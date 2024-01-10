return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  init = function()
    -- Disable netrw to not interfere with Nvim Tree
    -- See :help nvim-tree-netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,

  config = function()
    require("nvim-tree").setup({
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },

      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            folder_arrow = false,
          },
        },
      },

      view = {
        width = 35,
        number = true,
        signcolumn = "auto",
        relativenumber = true,
      },
    })
  end,

  keys = {
    { "<leader>1", ":NvimTreeToggle<cr>" },
    { "<leader>2", ":NvimTreeFindFile<cr>" },
  },
}
