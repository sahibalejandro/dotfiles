return {
  "nvim-telescope/telescope.nvim",

  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
  },

  config = function()
    require("telescope").setup {
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          width = { padding = 0 },
          height = { padding = 0 },
          preview_cutoff = 10,
        }
      }
    }

    local builtin = require "telescope.builtin"

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>of", builtin.oldfiles, { desc = "Telescope old files" })
    vim.keymap.set("n", "<leader>gs", builtin.grep_string, { desc = "Telescope grep string" })
    vim.keymap.set("n", "<leader>ht", builtin.help_tags, { desc = "Telescope help tags" })
  end,

  keys = {
    "<leader>ff",
    "<leader>lg",
    "<leader>of",
    "<leader>gs",
    "<leader>ht",
  }
}
