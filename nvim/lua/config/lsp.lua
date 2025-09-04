vim.lsp.enable('intelephense')
vim.lsp.enable('vtsls', {
  settings = {
    typescript = {
      tsserver = {
        maxTsServerMemory = 6144,
      },
    },
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end
  end,
})
