return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        -- These parsers are bundled in NeoVim since v0.9.0, by adding them
        -- to this list we ensure that these parsers are taken from Nvim
        -- Treesitter and they are updated correctly when running :TSUpdate
        "c",
        "lua",
        "vim",
        "vimdoc",
        "markdown",

        -- These parsers are not bundled in NeoVim.
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "php",
        "prisma",
        "rust",
        "scss",
        "sql",
        "tmux",
        "tsx",
        "typescript",
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
