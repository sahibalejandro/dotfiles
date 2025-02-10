return {
  'ibhagwan/fzf-lua',

  config = function()
    local fzf_lua = require("fzf-lua")

    fzf_lua.setup({
      winopts = {
        fullscreen = true,
        preview = {
          layout = "vertical",
          vertical = "down:80%",
          winopts = {
            number = false,
          },
        }
      },
      oldfiles = {
        include_current_session = true,
      },
      fzf_colors = true,
    })

    vim.keymap.set("n", "<leader>ff", fzf_lua.files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>of", fzf_lua.oldfiles, { desc = "Find old files" })
    vim.keymap.set("n", "<leader>gw", fzf_lua.grep_cword, { desc = "Grep word under cursor" })
    vim.keymap.set("n", "<leader>lg", fzf_lua.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>lk", fzf_lua.keymaps, { desc = "List keymaps" })
  end,

  keys = {
    "<leader>ff",
    "<leader>of",
    "<leader>gw",
    "<leader>lg",
    "<leader>lk",
  },
}
