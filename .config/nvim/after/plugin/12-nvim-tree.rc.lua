-- run commands
local status, tree = pcall(require, "nvim-tree")
if not status then
    return
end

tree.setup {
    actions = {
        open_file = {
            quit_on_open = false,
            window_picker = {
                exclude = {
                    filetype = { "notify", "packer", "qf" },
                    buftype = { "terminal" },
                },
            },
        },
    },
    disable_netrw = true,
    filters = {
        dotfiles = true,
    },
    git = {
        ignore = false,
    },
    hijack_cursor = true,
    hijack_netrw = true,
    ignore_ft_on_setup = { "dashboard" },
    open_on_tab = false,
    renderer = {
        add_trailing = false,
        highlight_git = false,
        highlight_opened_files = "none",
        icons = {
            glyphs = {
                default = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    deleted = "",
                    ignored = "◌",
                    renamed = "➜",
                    staged = "✓",
                    unmerged = "",
                    unstaged = "✗",
                    untracked = "★",
                },
                symlink = "",
            },
            show = {
                file = true,
                folder = true,
            },
        },
        indent_markers = {
            enable = false,
        },
        root_folder_modifier = table.concat {
            ":t:gs?$?/..",
            string.rep(" ", 1000),
            "?:gs?^??",
        },
    },
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    view = {
        side = "left",
        width = 30,
        hide_root_folder = true,
    },
}

-- mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<C-n>", ":NvimTreeToggle <CR>", opts)
map("n", "<leader>e", ":NvimTreeFocus <CR>", opts)
