local map = vim.keymap
local opts = { noremap = true, silent = true }

-- General
map.set("n", "<Esc>", ":noh <CR>", opts) -- clear search highlight
map.set("n", "<leader>w", ":write <CR>", opts) -- quick save
map.set("n", "<leader>q", ":quit! <CR>", opts) -- quick close
map.set("n", "<leader>x", ":exit <CR>", opts) -- quick save & close

-- Buffers/Tabs
map.set("n", "<S-t>", ":enew <CR>", opts) -- new buffer
map.set("n", "<C-t>", ":tabnew <CR>", opts) -- new tab

-- Splits
map.set("n", "<leader>h", ":sp <CR>", opts) -- split pane horizontally
map.set("n", "<leader>v", ":vs <CR>", opts) -- split pane vertically
