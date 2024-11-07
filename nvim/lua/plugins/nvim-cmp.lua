return {
  'hrsh7th/nvim-cmp',
  priority = 700,

  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'onsails/lspkind-nvim',
    'dcampos/nvim-snippy',
    'dcampos/cmp-snippy',
  },

  config = function()
    local cmp = require'cmp'

    cmp.setup{
      snippet = {
        expand = function(args)
          require'snippy'.expand_snippet(args.body)
        end,
      },

      window = {
        completion = cmp.config.window.bordered(),
      },

      formatting = {
        format = require'lspkind'.cmp_format(),
      },

      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
      }, {
        name = 'buffer',
      }),

      mapping = cmp.mapping.preset.insert({
        ['<esc>'] = cmp.mapping.abort(),
        ['<c-n>'] = cmp.mapping.scroll_docs(1),
        ['<c-p>'] = cmp.mapping.scroll_docs(-1),
        ['<c-j>'] = cmp.mapping.select_next_item(),
        ['<c-k>'] = cmp.mapping.select_prev_item(),
        ['<c-k>'] = cmp.mapping.select_prev_item(),
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
        ['<tab>'] = cmp.mapping.confirm({ select = true }),
      }),
    }
  end,
}
