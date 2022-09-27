-- run commands
local status, bufdel = pcall(require, "bufdel")
if not status then
    return
end

bufdel.setup {
    next = "cycle",
    quit = true,
}

-- mappings
vim.keymap.set("n", "<S-x>", ":BufDel <CR>", { noremap = true, silent = true })
