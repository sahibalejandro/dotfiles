return {
  "pmizio/typescript-tools.nvim",

  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
  },

  opts = {
    settings = {
<<<<<<< Updated upstream
      tsserver_max_memory = "auto",
=======
      tsserver_max_memory = 8000,
>>>>>>> Stashed changes
    },
  },
}
