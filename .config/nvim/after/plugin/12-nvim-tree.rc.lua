-- run commands
local status, tree = pcall(require, "nvim-tree")
if not status then
    return
end

tree.setup {}

-- mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<C-n>", ":NvimTreeToggle <CR>", opts)
map("n", "<leader>e", ":NvimTreeFocus <CR>", opts)
