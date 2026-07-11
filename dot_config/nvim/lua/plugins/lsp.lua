return {
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        ["*"] = {
          keys = {
            { "K", false },
            { "gh", vim.lsp.buf.hover },
            { "gk", vim.lsp.buf.signature_help },
          },
        },
      },
    },
  },
}
