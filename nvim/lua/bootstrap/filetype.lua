-- Adding Custom Filetypes
vim.filetype.add({
  extension = {
    js = function(path, bufnr)
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)

      -- Use TSX filetype for Flow scripts
      -- This regexp matches first line comments starting with:
      -- // @flow
      -- /* @flow
      -- For regexp info see :help usr_27
      if vim.regex([[^ *\/\+\*\=.*@flow]]):match_str(lines[1]) then
        return 'tsx'
      end

      return "javascript"
    end,
  },
})
