vim.lsp.enable('intelephense')

vim.lsp.config('vtsls', {
  filetypes = {
    'typescript',
    'javascript',
    'javascriptreact',
    'typescriptreact',
    'vue',
  },
  settings = {
    vtsls = {
      tsserver = {
        maxTsServerMemory = 8192,
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
            languages = { "vue" },
            configNamespace = "typescript",
          },
        },
      },
    },
  },
})
vim.lsp.enable({ 'vtsls', 'vue_ls' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end
  end,
})
