-- run commands
local status, tree = pcall(require, "nvim-tree")
if not status then
    return
end

tree.setup {
    update_focused_file = {
        enable = true,
    },
    renderer = {
        icons = {
            glyphs = {
                default = " ",
                symlink = " ",
                bookmark = " ",
                modified = "●",
                folder = {
                    arrow_closed = "",
                    arrow_open = " ",
                    default = " ",
                    open = " ",
                    empty = " ",
                    empty_open = " ",
                    symlink = " ",
                    symlink_open = " ",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = " ",
                    renamed = "➜",
                    untracked = "★",
                    deleted = " ",
                    ignored = "◌",
                },
            },
        },
    },
}

-- mappings
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle <CR>", opts)
vim.keymap.set("n", "<leader>e", ":NvimTreeFocus <CR>", opts)
