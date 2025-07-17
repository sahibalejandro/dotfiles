return {
  'ibhagwan/fzf-lua',

  config = function()
    local fzf_lua = require("fzf-lua")

    fzf_lua.setup({
      winopts = {
        fullscreen = true,
        preview = {
          layout = "vertical",
          vertical = "down:70%",
          winopts = {
            number = false,
          },
        }
      },
      oldfiles = {
        include_current_session = true,
      },
      fzf_colors = true,
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
    })

    local function fzf_picker_preview_hidden(picker_name)
      return function()
        fzf_lua[picker_name]({
          winopts = {
            preview = { hidden = true }
          }
        })
      end
    end

    vim.keymap.set("n", "<leader>f", fzf_picker_preview_hidden("files"), { desc = "Find files" })
    vim.keymap.set("n", "<leader>o", fzf_picker_preview_hidden("oldfiles"), { desc = "Find old files" })
    vim.keymap.set("n", "<leader>k", fzf_lua.grep_cword, { desc = "Grep word under cursor" })
    vim.keymap.set("n", "<leader>s", fzf_lua.live_grep, { desc = "Live grep" })
  end,

  keys = {
    "<leader>f",
    "<leader>o",
    "<leader>k",
    "<leader>s",
  },
}
