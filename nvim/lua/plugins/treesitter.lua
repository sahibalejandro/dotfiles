return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'main',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local nvim_treesitter = require('nvim-treesitter')

    -- Automatically install parser for my common programming languages
    nvim_treesitter.install({
      'bash',
      'css',
      'dockerfile',
      'html',
      'javascript',
      'json',
      'lua',
      'markdown',
      'markdown_inline',
      'php',
      'rust',
      'scss',
      'sql',
      'tmux',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vue',
      'yaml',
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '*' },
      callback = function(ev)
        local filetype = vim.bo[ev.buf].filetype
        local installed_parsers = nvim_treesitter.get_installed()

        if not vim.tbl_contains(installed_parsers, filetype) then
          vim.notify("Treesitter parser for " .. filetype .. " is not installed. Run :TSInstall " .. filetype, vim.log.levels.WARN)
        else
          -- syntax highlighting, provided by Neovim
          vim.treesitter.start()
          -- folds, provided by Neovim
          -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          -- vim.wo.foldmethod = 'expr'
          -- indentation, provided by nvim-treesitter
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
