return {
  {
    "tokyonight.nvim",
    enabled = false,
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "warmer",
      colors = {
        illuminate = "#3b3f4c",
      },
      highlights = {
        illuminatedWord = { bg = "$illuminate" },
        illuminatedCurWord = { bg = "$illuminate" },
        IlluminatedWordText = { bg = "$illuminate" },
        IlluminatedWordRead = { bg = "$illuminate" },
        IlluminatedWordWrite = { bg = "$illuminate" },

        DiagnosticVirtualTextError = { fg = "$red" },
        DiagnosticVirtualTextWarn = { fg = "$yellow" },
        DiagnosticVirtualTextInfo = { fg = "$cyan" },
        DiagnosticVirtualTextHint = { fg = "$purple" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
