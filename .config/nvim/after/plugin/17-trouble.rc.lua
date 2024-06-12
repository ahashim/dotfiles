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
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
