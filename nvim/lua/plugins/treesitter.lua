return {
  "nvim-treesitter/nvim-treesitter",

  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "lua",
        "php",
        "prisma",
        "rust",
        "scss",
        "sql",
        "tmux",
        "tsx",
        "typescript",
        "vim",
        "vue",
        "yaml",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
  end
}
