return {
  "pmizio/typescript-tools.nvim",

  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
  },

  opts = {
    settings = {
      tsserver_max_memory = 1024
    }
  },
}
