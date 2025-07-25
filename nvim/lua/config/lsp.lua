vim.lsp.config('*', {
  on_attach = function(client, bufnr)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end
  end,
})

vim.lsp.enable('php')
