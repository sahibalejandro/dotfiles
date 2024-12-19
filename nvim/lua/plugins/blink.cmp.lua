return {
  'saghen/blink.cmp',
  version = 'v0.7.*',
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
  },
  sources = {
    default = { 'lsp' }
  }
}
