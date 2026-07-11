return {
  {
    "nvim-lspconfig",
    opts = {
      servers = {
        angularls = {},
      },
    },
  },
  { import = "lazyvim.plugins.extras.lang.typescript" },
}
