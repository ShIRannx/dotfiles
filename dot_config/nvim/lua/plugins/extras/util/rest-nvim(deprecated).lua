return {
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    keys = {
      {
        "<leader>rr",
        "<cmd>Rest run<cr>",
        "Run request under the cursor",
      },
      {
        "<leader>rl",
        "<cmd>Rest run last<cr>",
        "Re-run latest request",
      },
    },
    dependencies = {
      {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
        opts = {
          rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
        },
      },
    },
    config = function()
      require("rest-nvim").setup()
    end,
  },
  {
    "nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "http" })
    end,
  },
}
