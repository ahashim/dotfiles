-- run commands
local status, comment = pcall(require, "Comment")
if not status then
    return
end

comment.setup()

-- mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", opts)
map("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", opts)
