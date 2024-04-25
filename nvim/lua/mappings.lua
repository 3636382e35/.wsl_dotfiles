require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
map("n", "j", "gj")

map("n", "k", "gk")

map("v", "J", ":m '>+1<CR>gv=gv") -- Shift visual selected line down
map("v", "K", ":m '<-2<CR>gv=gv") -- Shift visual selected line up

map("n", "<C-a>", ":TodoTelescope<CR>")
map("n", "<C-p>", ":Telescope find_files<CR>")
