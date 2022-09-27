-- run commands
local status, bufferline = pcall(require, "bufferline")
if not status then
    return
end

bufferline.setup {
    options = {
        mode = "buffers",
        numbers = "none",
        close_command = ":BufDel <CR>",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = "bdelete! %d",
        indicator = {
            icon = "▎", -- this should be omitted if indicator style is not 'icon'
            style = "icon",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 24,
        diagnostics = true,
        offsets = {
            {
                filetype = "NvimTree",
                padding = 1,
            },
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_buffer_default_icon = true,
        show_close_icon = false,
        show_tab_indicators = true,
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
    },
    highlights = {
        background = {
            fg = "#6F737B",
        },
        buffer_selected = {
            fg = "#A0A8B7",
            italic = false,
        },
        buffer_visible = {
            fg = "#A0A8B7",
        },
        fill = {
            bg = "#181B20",
        },
        separator = {
            bg = "#181B20",
            fg = "#181B20",
        },
        indicator_selected = {
            fg = "#61AFEF",
            bg = "#1F2329",
        },
    },
}

-- mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<Tab>", "<Cmd>BufferLineCycleNext <CR>", opts)
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev <CR>", opts)
