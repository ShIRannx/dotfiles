return {
  {
    "tokyonight.nvim",
    enabled = false,
  },
  {
    "Mofiqul/vscode.nvim",
    opts = function()
      local c = require("vscode.colors").get_colors()

      return {
        -- Enable italic comment
        italic_comments = true,

        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,

        group_overrides = {
          CmpGhostText = { link = "LineNr" },

          NeoTreeNormal = { link = "NvimTreeNormal" },
          NeoTreeNormalNC = { link = "NvimTreeNormal" },
          NeoTreeVertSplit = { link = "NvimTreeVertSplit" },
          NeoTreeEndOfBuffer = { link = "NvimTreeEndOfBuffer" },
          NeoTreeRootName = { link = "NvimTreeRootFolder" },
          NeoTreeGitAdded = { link = "NvimTreeGitNew" },
          NeoTreeGitDeleted = { link = "NvimTreeGitDeleted" },
          NeoTreeGitModified = { link = "NvimTreeGitDirty" },
          NeoTreeGitConflict = { fg = c.vscGitConflicting },
          NeoTreeGitUntracked = { link = "NvimTreeGitMerge" },

          MiniIndentscopePrefix = { nocombine = true },
          MiniIndentscopeSymboloff = { link = "IndentBlanklineChar" },
          MiniIndentscopeSymbol = { link = "IndentBlanklineContextChar" },

          illuminate = { bg = "#484848" },
          illuminatedWord = { link = "illuminate" },
          illuminatedCurWord = { link = "illuminate" },
          IlluminatedWordText = { link = "illuminate" },
          IlluminatedWordRead = { link = "illuminate" },
          IlluminatedWordWrite = { link = "illuminate" },

          BufferLineIndicatorSelected = { link = "BufferCurrentSign" },
        },
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
  {
    "bufferline.nvim",
    optional = true,
    opts = {
      options = {
        show_close_icon = false,
      },
      highlights = {
        fill = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        background = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        buffer_visible = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        buffer_selected = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        duplicate_selected = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        duplicate_visible = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        duplicate = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        separator = {
          fg = { attribute = "bg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        separator_selected = {
          fg = { attribute = "fg", highlight = "Special" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        indicator_visible = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        separator_visible = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        tab = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        tab_separator = {
          fg = { attribute = "bg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        tab_separator_selected = {
          fg = { attribute = "bg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        tab_selected = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        close_button = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        close_button_selected = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        close_button_visible = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        modified = {
          fg = { attribute = "fg", highlight = "NeoTreeGitModified" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        modified_visible = {
          fg = { attribute = "fg", highlight = "NeoTreeGitModified" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        modified_selected = {
          fg = { attribute = "fg", highlight = "NeoTreeGitModified" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        warning = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        warning_visible = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        warning_selected = {
          fg = { attribute = "fg", highlight = "DiagnosticSignWarn" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        warning_diagnostic = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        warning_diagnostic_visible = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        error = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        error_visible = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        error_diagnostic = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        error_diagnostic_visible = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        error_selected = {
          fg = { attribute = "fg", highlight = "DiagnosticSignError" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        info = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        info_visible = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        info_diagnostic = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        info_diagnostic_visible = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        info_selected = {
          fg = { attribute = "fg", highlight = "DiagnosticSignInfo" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        hint = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        hint_visible = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        hint_selected = {
          fg = { attribute = "fg", highlight = "DiagnosticSignHint" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        hint_diagnostic = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        hint_diagnostic_selected = {
          fg = { attribute = "fg", highlight = "DiagnosticSignHint" },
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
      },
    },
  },
  {
    "lualine.nvim",
    optional = true,
    opts = function(_, opts)
      local Util = require("lazyvim.util")
      local icons = require("lazyvim.config").icons

      opts.sections.lualine_c = {
        Util.lualine.root_dir(),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { Util.lualine.pretty_path(), color = Util.ui.fg("Normal") },
      }
      return opts
    end,
  },
}
