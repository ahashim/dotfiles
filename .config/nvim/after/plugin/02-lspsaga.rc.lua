-- run commands
local status, saga = pcall(require, "lspsaga")
if not status then
    return
end

saga.init_lsp_saga {
    -- general
    border_style = "single",
    max_preview_lines = 30,
    server_filetype_map = {
        typescript = "typescript",
    },

    -- code actions
    code_action_icon = "🗲 ",
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    code_action_lightbulb = {
        enable = true,
        sign = true,
        enable_in_insert = false,
        sign_priority = 20,
        virtual_text = true,
    },

    -- diagnostics
    diagnostic_header = { " ", " ", " ", " " },

    -- finder
    finder_icons = {
        def = "  ",
        ref = "諭 ",
        link = "  ",
    },
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "q",
        scroll_down = "<C-d>",
        scroll_up = "<C-u>",
    },

    -- rename
    rename_action_quit = "<Esc>",
}

-- mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "gh", ":Lspsaga lsp_finder <CR>", opts)
map("n", "gd", ":Lspsaga peek_definition <CR>", opts)
map("n", "gr", ":Lspsaga rename <CR>", opts)
map("n", "gs", ":Lspsaga signature_help <CR>", opts)
map("n", "gx", ":Lspsaga code_action <CR>", opts)
map("x", "gx", ":<c-u>Lspsaga range_code_action <CR>", opts)
map("n", "K", ":Lspsaga hover_doc <CR>", opts)
map("n", "go", ":Lspsaga show_line_diagnostics <CR>", opts)
map("n", "<C-j>", ":Lspsaga diagnostic_jump_next <CR>", opts)
map("n", "<C-k>", ":Lspsaga diagnostic_jump_prev <CR>", opts)
