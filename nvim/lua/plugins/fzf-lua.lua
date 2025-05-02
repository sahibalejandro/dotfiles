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
        fzf_lua[picker_name] {
          winopts = {
            preview = { hidden = true }
          }
        }
      end
    end

    vim.keymap.set("n", "<leader>ff", fzf_picker_preview_hidden "files", { desc = "Find files" })
    vim.keymap.set("n", "<leader>of", fzf_picker_preview_hidden "oldfiles", { desc = "Find old files" })
    vim.keymap.set("n", "<leader>gw", fzf_lua.grep_cword, { desc = "Grep word under cursor" })
    vim.keymap.set("n", "<leader>lg", fzf_lua.live_grep, { desc = "Live grep" })
  end,

  keys = {
    "<leader>ff",
    "<leader>of",
    "<leader>gw",
    "<leader>lg",
    "<leader>lk",
  },
}
