-- Adding Custom Filetypes
vim.filetype.add({
  extension = {
    js = function(path, bufnr)
      local first_line = vim.filetype.getlines(bufnr, 1)

      -- Use TSX filetype for Flow scripts
      -- This regexp matches first line comments starting with:
      -- // @flow
      -- /* @flow
      -- For regexp info see :help usr_27
      if vim.filetype.matchregex(first_line, [[^ *\/\+\*\=.*@flow]]) then
        return 'flow'
      end

      return "javascript"
    end,
  },
})
