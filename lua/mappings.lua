require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- custom mappings
map("n", "<leader>gs", vim.cmd.Git, {desc = "Vim Fugetive Git"})
map("n", "<leader>b", require("telescope.builtin").buffers)


map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")


-- greatest remap ever set previous yank into void register
map("x", "<leader>p", "\"_dp")
map("n", "<leader>q", ":<C-U>bprevious <bar>bd #<CR>")

nomap("n", "<leader>v");

-- Open tmux sessionizer
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

require "configs.harpoon"
