-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<A-J>", ":t.<CR>")
map("n", "<A-K>", ":t-<CR>")
map("v", "<A-J>", ":t '><CR>`[V`]")
map("v", "<A-K>", ":t '><CR>gv=gv")

map("i", "<C-a>", "<Esc>I")
map("i", "<C-e>", "<Esc>A")
map({ "n", "v" }, "<C-a>", "^")
map({ "n", "v" }, "<C-e>", "$")

map({ "n", "v" }, "j", "gj")
map({ "n", "v" }, "k", "gk")

map("n", "<C-s>", "<cmd>w<cr>")
map("i", "<C-s>", "<Esc>:w<cr>")

map("n", "<C-q>", "<cmd>qa!<cr>")

map("n", "<leader>nh", "<cmd>nohl<cr>")
map("t", "<ESC>", "<C-\\><C-n>")

local umap = vim.keymap.del
umap("n", "<S-h>")
umap("n", "<S-l>")
