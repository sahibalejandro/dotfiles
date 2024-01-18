return {
  'hrsh7th/nvim-cmp',

  dependencies = {
    'SirVer/ultisnips',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'onsails/lspkind-nvim',
  },

  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn['UltiSnips#Anon'](args.body)
        end,
      },

      formatting = {
        format = lspkind.cmp_format(),
      },

      sources = cmp.config.sources({
        { name = 'ultisnips' },
        -- nvim_lsp source is added as a dependency of mason-lspconfig.
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
      }, {
        name = 'buffer',
      }),

      mapping = cmp.mapping.preset.insert({
        ['<c-j>'] = cmp.mapping.select_next_item(),
        ['<c-k>'] = cmp.mapping.select_prev_item(),
        ['<c-n>'] = cmp.mapping.scroll_docs(1),
        ['<c-p>'] = cmp.mapping.scroll_docs(-1),
        ['<c-k>'] = cmp.mapping.select_prev_item(),
        ['<tab>'] = cmp.mapping.confirm({ select = true }),
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
        ['<esc>'] = cmp.mapping.abort(),
      }),
    })
  end,
}
