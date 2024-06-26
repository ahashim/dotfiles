-- run commands
local status, lspsaga = pcall(require, "lspsaga")
if not status then
    return
end

lspsaga.setup {
    lightbulb = {
        enable = false,
    },
}

-- mappings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga finder<CR>", opts)

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
keymap("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

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
