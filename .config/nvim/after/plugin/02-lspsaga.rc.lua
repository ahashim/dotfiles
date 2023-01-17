-- run commands
local status, saga = pcall(require, "lspsaga")
if not status then
    return
end

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
        sign_priority = 20,
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
        kind = {},
    },
}

-- mappings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)

-- Code action
keymap({ "n", "v" }, "gx", "<cmd>Lspsaga code_action<CR>")

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")

-- Go to Definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Show line diagnostics you can pass argument ++unfocus to make
-- show_line_diagnostics float window unfocus
keymap("n", "go", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show cursor diagnostic
-- also like show_line_diagnostics  support pass ++unfocus
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Show buffer diagnostic
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Diagnostic jump can use `<c-o>` to jump back
keymap("n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filter like Only jump to error
keymap("n", "<C-K>", function()
    require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.ERROR }
end)
keymap("n", "<C-J>", function()
    require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.ERROR }
end)

-- Toggle Outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- if there has no hover will have a notify no information available
-- to disable it just Lspsaga hover_doc ++quiet
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- Callhierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Float terminal
keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
