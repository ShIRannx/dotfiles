return {
  {
    "nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {},
      },
    },
  },
  {
    "mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "ansible-lint" })
    end,
  },
  {
    "copilot.lua",
    ft = "yaml.ansible",
    optional = true,
    opts = function(_, opts)
      opts.filetypes = vim.tbl_extend("force", opts.filetypes or {}, { ["yaml.ansible"] = true })
      return opts
    end,
  },
}
