-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.VM_maps = {
  ["I BS"] = "<C-h>",
  ["Exit"] = "<C-c>",
  ["Select Cursor Up"] = "<S-k>",
  ["Select Cursor Down"] = "<S-j>",
}
vim.g.lazyvim_python_lsp = "jedi_language_server"
vim.g.lazyvim_python_ruff = "ruff"
vim.g.snacks_animate = false
vim.g.lazyvim_blink_main = true
vim.opt.laststatus = 3
