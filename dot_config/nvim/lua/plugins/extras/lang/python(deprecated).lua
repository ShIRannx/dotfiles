return {
  {
    "nvim-lspconfig",
    opts = {
      servers = {
        jedi_language_server = {},
        pyright = { mason = false },
      },
      setup = {
        pyright = function()
          return true
        end,
      },
    },
  },
  -- bugfix
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  { import = "lazyvim.plugins.extras.lang.python" },
}
