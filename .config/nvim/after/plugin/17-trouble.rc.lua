-- run commands
local present, trouble = pcall(require, "trouble")
if not present then
    return
end

trouble.setup {
    signs = {
        error = "",
        hint = "",
        information = "",
        warning = "",
    },
}

-- mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<leader>xx", ":TroubleToggle <CR>", opts)
map("n", "<leader>xw", ":Trouble workspace_diagnostics <CR>", opts)
map("n", "<leader>xd", ":Trouble document_diagnostics <CR>", opts)
map("n", "<leader>xl", ":Trouble loclist <CR>", opts)
map("n", "<leader>xq", ":Trouble quickfix <CR>", opts)
map("n", "gR", ":Trouble lsp_references <CR>", opts)
