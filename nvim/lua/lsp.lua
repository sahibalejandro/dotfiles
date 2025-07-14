vim.lsp.config('*', {
  on_attach = function(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
  end
})

vim.lsp.enable('typescript')
