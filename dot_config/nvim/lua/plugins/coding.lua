return {
  {
    "kylechui/nvim-surround",
    version = "*", -- for stability; omit to use `main` branch for the latest features
    event = "LazyFile",
    opts = {
      aliases = {
        ["d"] = '"',
        ["s"] = "'",
        ["u"] = { "}", "]", ")", ">", '"', "'", "`" },
      },
    },
    config = function(_, opts)
      require("nvim-surround").setup(opts)
    end,
  },
  {
    "mg979/vim-visual-multi",
    event = "LazyFile",
    branch = "master",
  },
  {
    "mini.ai",
    opts = {
      custom_textobjects = {
        ["r"] = { { "%b[]" }, "^.().*().$" },
        ["d"] = { { '%b""' }, "^.().*().$" },
        ["s"] = { { "%b''" }, "^.().*().$" },
        ["u"] = { { "%b''", '%b""', "%b``", "%b()", "%b[]", "%b{}", "%b<>" }, "^.().*().$" },
      },
    },
  },
}
