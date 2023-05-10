-- run commands
local status, saga = pcall(require, "lspsaga")
if not status then
    return
end

local icons = require "icons"

saga.setup {
    callhierarchy = {
        show_detail = false,
        keys = {
            edit = "e",
            vsplit = "s",
            split = "i",
            tabe = "t",
            jump = "o",
            quit = "q",
            expand_collapse = "u",
        },
    },
    code_action = {
        num_shortcut = true,
        keys = {
            -- string |table type
            quit = "q",
            exec = "<CR>",
        },
    },
    definition = {
        edit = "<C-c>o",
        vsplit = "<C-c>v",
        split = "<C-c>i",
        tabe = "<C-c>t",
        quit = "q",
        close = "<Esc>",
    },
    diagnostic = {
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        keys = {
            exec_action = "o",
            quit = "q",
            go_action = "g",
        },
    },
    finder = {
        edit = { "o", "<CR>" },
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = { "q", "<ESC>" },
    },
    lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = true,
        sign_priority = 0,
        virtual_text = true,
    },
    outline = {
        win_position = "right",
        win_with = "",
        win_width = 30,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
            jump = "o",
            expand_collapse = "u",
            quit = "q",
        },
    },
    preview = {
        lines_above = 0,
        lines_below = 10,
    },
    rename = {
        quit = "<Esc>",
        exec = "<CR>",
        mark = "x",
        confirm = "<CR>",
        in_select = true,
        whole_project = true,
    },
    request_timeout = 2000,
    scroll_preview = {
        scroll_down = "<C-u>",
        scroll_up = "<C-d>",
    },
    symbol_in_winbar = {
        enable = true,
        separator = " ",
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = false,
    },
    ui = {
        -- currently only round theme
        theme = "round",
        title = true,
        -- border type can be single,double,rounded,solid,shadow.
        border = "single",
        winblend = 0,
        expand = "",
        collapse = "",
        preview = " ",
        code_action = "💡",
        diagnostic = "🐞",
        incoming = " ",
        outgoing = " ",
        colors = {
            --float window normal background color
            normal_bg = "#1d1536",
            --title background color
            title_bg = "#8EBD6B",
            red = "#E55561",
            magenta = "#8B3434",
            orange = "#CC9057",
            yellow = "#E2B86B",
            green = "#8EBD6B",
            cyan = "#48B0BD",
            blue = "#4FA6ED",
            purple = "#BF68D9",
            white = "#d1d4cf",
            black = "#0E1013",
        },
        kind = {
            ["File"] = { " ", "Tag" },
            ["Module"] = { " ", "Exception" },
            ["Namespace"] = { " ", "Include" },
            ["Package"] = { " ", "Label" },
            ["Class"] = { " ", "Include" },
            ["Method"] = { " ", "Function" },
            ["Property"] = { " ", "@property" },
            ["Field"] = { " ", "@field" },
            ["Constructor"] = { " ", "@constructor" },
            ["Enum"] = { " ", "@number" },
            ["Interface"] = { " ", "Type" },
            ["Function"] = { "󰊕 ", "Function" },
            ["Variable"] = { " ", "@variable" },
            ["Constant"] = { " ", "Constant" },
            ["String"] = { "󰅳 ", "String" },
            ["Number"] = { "󰎠 ", "Number" },
            ["Boolean"] = { " ", "Boolean" },
            ["Array"] = { "󰅨 ", "Type" },
            ["Object"] = { " ", "Type" },
            ["Key"] = { " ", "Constant" },
            ["Null"] = { "󰟢 ", "Constant" },
            ["EnumMember"] = { " ", "Number" },
            ["Struct"] = { " ", "Type" },
            ["Event"] = { " ", "Constant" },
            ["Operator"] = { " ", "Operator" },
            ["TypeParameter"] = { " ", "Type" },
            ["TypeAlias"] = { " ", "Type" },
            ["Parameter"] = { " ", "@parameter" },
            ["StaticMethod"] = { " ", "Function" },
            ["Macro"] = { " ", "Macro" },
            ["Text"] = { "󰭷 ", "String" },
            ["Snippet"] = { " ", "@variable" },
            ["Folder"] = { " ", "Title" },
            ["Unit"] = { "󰊱 ", "Number" },
            ["Value"] = { " ", "@variable" },
        },
    },
}

-- mappings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

-- Rename all occurrences of the hovered word for the entire file
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>", opts)

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)

-- Go to definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)

-- Go to type definition
keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", opts)

-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

-- Show buffer diagnostics
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)

-- Show workspace diagnostics
keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)

-- Show cursor diagnostics
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
    require("lspsaga.diagnostic"):goto_prev { severity = vim.diagnostic.severity.ERROR }
end, opts)
keymap("n", "]E", function()
    require("lspsaga.diagnostic"):goto_next { severity = vim.diagnostic.severity.ERROR }
end, opts)

-- Toggle outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)

-- Floating terminal
keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", opts)
