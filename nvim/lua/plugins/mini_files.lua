return {
  "echasnovski/mini.files",

  version = "*",

  config = function()
    require("mini.files").setup({
      options = {
        permanent_delete = false, -- Move deleted files to trash
      }
    })

    vim.keymap.set( "n", "<leader>1", ":lua MiniFiles.open(nil, false)<cr>", {
      desc = "Open MiniFiles on current working directory.",
    })

    vim.keymap.set("n", "<leader>2", ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<cr>", {
      desc = "Open MiniFiles on current buffer directory.",
    })
  end
}
