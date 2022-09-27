-- mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<leader>ai", ":Git add -i <CR>", opts)
map("n", "<leader>cm", ":Git commit <CR>", opts)
map("n", "<leader>df", ":Git diff <CR>", opts)
map("n", "<leader>dc", ":Git diff --cached <CR>", opts)
map("n", "<leader>ps", ":Git push origin <CR>", opts)
map("n", "<leader>ri", ":Git rebase -i <CR>", opts)
