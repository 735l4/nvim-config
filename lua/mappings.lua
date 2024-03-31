require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- custom mappings
map("n", "<leader>gs", vim.cmd.Git)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
