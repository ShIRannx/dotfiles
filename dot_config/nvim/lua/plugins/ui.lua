return {
  {
    "lualine.nvim",
    opts = {
      options = {
        component_separators = "|",
        section_separators = "",
      },
    },
  },
  {
    "bufferline.nvim",
    keys = {
      { "<S-h>", false },
      { "<S-l>", false },
      { "<A-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<A-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    },
    opts = {
      options = {
        show_close_icon = false,
      },
    },
  },
  {
    "noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
  },
}
